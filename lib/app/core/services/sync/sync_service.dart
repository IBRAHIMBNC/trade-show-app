import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/services/connectivity_service.dart';
import 'package:supplier_snap/app/core/services/sync/document_sync_service.dart';
import 'package:supplier_snap/app/core/services/sync/file_sync_helper.dart';
import 'package:supplier_snap/app/core/services/sync/notes_sync_service.dart';
import 'package:supplier_snap/app/core/services/sync/product_sync_service.dart';
import 'package:supplier_snap/app/core/services/sync/supplier_sync_service.dart';
import 'package:supplier_snap/app/core/services/sync/sync_progress.dart';

/// Main sync service that orchestrates all table sync services
/// Handles connectivity changes, app lifecycle, and provides progress updates
class SyncService extends GetxService {
  final AppDatabase database;
  final SupabaseClient supabaseClient;
  final ConnectivityService connectivityService;

  // Individual sync services
  late final SupplierSyncService _supplierSync;
  late final ProductSyncService _productSync;
  late final NotesSyncService _notesSync;
  late final DocumentSyncService _documentSync;

  // Shared file sync helper
  late final FileSyncHelper _fileSyncHelper;

  // Reactive progress state
  final Rx<SyncProgress> progress = Rx<SyncProgress>(SyncProgress.idle());

  // Connectivity listener subscription
  StreamSubscription? _connectivitySubscription;

  // Flag to track if initial sync has been performed
  bool _hasPerformedInitialSync = false;

  // Convenience getter for UI
  bool get isSyncing => progress.value.isSyncing;

  SyncService({
    required this.database,
    required this.supabaseClient,
    required this.connectivityService,
  });

  /// Initialize the sync service and all child sync services
  Future<SyncService> init() async {
    _fileSyncHelper = FileSyncHelper(supabaseClient: supabaseClient);

    // Initialize sync services in dependency order
    _supplierSync = SupplierSyncService(
      database: database,
      supabaseClient: supabaseClient,
      fileSyncHelper: _fileSyncHelper,
    );

    _productSync = ProductSyncService(
      database: database,
      supabaseClient: supabaseClient,
      supplierSyncService: _supplierSync,
      fileSyncHelper: _fileSyncHelper,
    );

    _notesSync = NotesSyncService(
      database: database,
      supabaseClient: supabaseClient,
      supplierSyncService: _supplierSync,
      fileSyncHelper: _fileSyncHelper,
    );

    _documentSync = DocumentSyncService(
      database: database,
      supabaseClient: supabaseClient,
      supplierSyncService: _supplierSync,
      fileSyncHelper: _fileSyncHelper,
    );

    // Listen to connectivity changes
    _connectivitySubscription = connectivityService.connectivityStream.listen(
      _onConnectivityChanged,
    );

    debugPrint('SyncService: Initialized');
    return this;
  }

  /// Handle connectivity changes
  void _onConnectivityChanged(bool isOnline) async {
    debugPrint('SyncService: Connectivity changed - isOnline: $isOnline');

    if (isOnline) {
      // Coming online - sync unsynced data and start realtime
      await syncAll();
      _startRealtimeListeners();
    } else {
      // Going offline - stop realtime listeners
      _stopRealtimeListeners();
    }
  }

  /// Perform full sync: push unsynced local → remote, then pull remote → local
  /// Called on app start, connectivity change, and app resume
  Future<void> syncAll() async {
    if (!connectivityService.isOnline.value) {
      debugPrint('SyncService: Offline, skipping sync');
      return;
    }

    if (supabaseClient.auth.currentUser == null) {
      debugPrint('SyncService: No user logged in, skipping sync');
      return;
    }

    if (progress.value.isSyncing) {
      debugPrint('SyncService: Sync already in progress, skipping');
      return;
    }

    try {
      progress.value = SyncProgress.syncing(table: 'Starting...');

      // Count total items to sync
      final totalItems = await _countTotalItems();
      var currentItem = 0;

      // Sync in FK dependency order: Supplier → Product → Notes → Documents

      // 1. Sync Suppliers
      progress.value = SyncProgress.syncing(
        table: 'Suppliers',
        current: currentItem,
        total: totalItems,
      );
      await _supplierSync.syncUnsynced(
        onProgress: (current, total) {
          progress.value = progress.value.copyWith(
            currentTable: 'Suppliers',
            currentItem: currentItem + current,
            totalItems: totalItems,
          );
        },
      );
      currentItem += (await _supplierSync.getUnsyncedRecords()).length;

      // 2. Sync Products
      progress.value = SyncProgress.syncing(
        table: 'Products',
        current: currentItem,
        total: totalItems,
      );
      await _productSync.syncUnsynced(
        onProgress: (current, total) {
          progress.value = progress.value.copyWith(
            currentTable: 'Products',
            currentItem: currentItem + current,
            totalItems: totalItems,
          );
        },
      );
      currentItem += (await _productSync.getUnsyncedRecords()).length;

      // 3. Sync Notes
      progress.value = SyncProgress.syncing(
        table: 'Notes',
        current: currentItem,
        total: totalItems,
      );
      await _notesSync.syncUnsynced(
        onProgress: (current, total) {
          progress.value = progress.value.copyWith(
            currentTable: 'Notes',
            currentItem: currentItem + current,
            totalItems: totalItems,
          );
        },
      );
      currentItem += (await _notesSync.getUnsyncedRecords()).length;

      // 4. Sync Documents
      progress.value = SyncProgress.syncing(
        table: 'Documents',
        current: currentItem,
        total: totalItems,
      );
      await _documentSync.syncUnsynced(
        onProgress: (current, total) {
          progress.value = progress.value.copyWith(
            currentTable: 'Documents',
            currentItem: currentItem + current,
            totalItems: totalItems,
          );
        },
      );

      progress.value = SyncProgress.completed();
      debugPrint('SyncService: Sync completed successfully');
    } catch (e) {
      debugPrint('SyncService: Sync error: $e');
      progress.value = SyncProgress.error(e.toString());
    }
  }

  /// Perform initial sync after login
  /// Pulls all data from remote and populates local database
  Future<void> initialSync() async {
    if (_hasPerformedInitialSync) {
      debugPrint('SyncService: Initial sync already performed');
      return;
    }

    if (!connectivityService.isOnline.value) {
      debugPrint('SyncService: Offline, cannot perform initial sync');
      return;
    }

    if (supabaseClient.auth.currentUser == null) {
      debugPrint('SyncService: No user logged in, cannot perform initial sync');
      return;
    }

    if (progress.value.isSyncing) {
      debugPrint('SyncService: Sync already in progress');
      return;
    }

    try {
      progress.value = SyncProgress.syncing(table: 'Initial sync...');

      // Pull from remote in FK dependency order
      debugPrint('SyncService: Starting initial sync - pulling from remote');

      // 1. Pull Suppliers first
      progress.value = SyncProgress.syncing(table: 'Suppliers (download)');
      await _supplierSync.pullFromRemote(
        onProgress: (current, total) {
          progress.value = progress.value.copyWith(
            currentTable: 'Suppliers (download)',
            currentItem: current,
            totalItems: total,
          );
        },
      );

      // 2. Pull Products
      progress.value = SyncProgress.syncing(table: 'Products (download)');
      await _productSync.pullFromRemote(
        onProgress: (current, total) {
          progress.value = progress.value.copyWith(
            currentTable: 'Products (download)',
            currentItem: current,
            totalItems: total,
          );
        },
      );

      // 3. Pull Notes
      progress.value = SyncProgress.syncing(table: 'Notes (download)');
      await _notesSync.pullFromRemote(
        onProgress: (current, total) {
          progress.value = progress.value.copyWith(
            currentTable: 'Notes (download)',
            currentItem: current,
            totalItems: total,
          );
        },
      );

      // 4. Pull Documents
      progress.value = SyncProgress.syncing(table: 'Documents (download)');
      await _documentSync.pullFromRemote(
        onProgress: (current, total) {
          progress.value = progress.value.copyWith(
            currentTable: 'Documents (download)',
            currentItem: current,
            totalItems: total,
          );
        },
      );

      // Now push any local unsynced data
      await syncAll();

      _hasPerformedInitialSync = true;
      progress.value = SyncProgress.completed();
      debugPrint('SyncService: Initial sync completed');

      // Start realtime listeners
      _startRealtimeListeners();
    } catch (e) {
      debugPrint('SyncService: Initial sync error: $e');
      progress.value = SyncProgress.error(e.toString());
    }
  }

  /// Start realtime listeners for all tables
  void _startRealtimeListeners() {
    if (!connectivityService.isOnline.value) return;
    if (supabaseClient.auth.currentUser == null) return;

    debugPrint('SyncService: Starting realtime listeners');
    _supplierSync.startRealtimeListener();
    _productSync.startRealtimeListener();
    _notesSync.startRealtimeListener();
    _documentSync.startRealtimeListener();
  }

  /// Stop realtime listeners for all tables
  void _stopRealtimeListeners() {
    debugPrint('SyncService: Stopping realtime listeners');
    _supplierSync.stopRealtimeListener();
    _productSync.stopRealtimeListener();
    _notesSync.stopRealtimeListener();
    _documentSync.stopRealtimeListener();
  }

  /// Count total unsynced items across all tables
  Future<int> _countTotalItems() async {
    final suppliers = await _supplierSync.getUnsyncedRecords();
    final products = await _productSync.getUnsyncedRecords();
    final notes = await _notesSync.getUnsyncedRecords();
    final documents = await _documentSync.getUnsyncedRecords();
    return suppliers.length + products.length + notes.length + documents.length;
  }

  /// Called when app resumes from background
  Future<void> onAppResumed() async {
    debugPrint('SyncService: App resumed');
    if (connectivityService.isOnline.value) {
      await syncAll();
    }
  }

  /// Called when user logs in
  Future<void> onUserLoggedIn() async {
    debugPrint('SyncService: User logged in');
    _hasPerformedInitialSync = false;
    await initialSync();
  }

  /// Called when user logs out
  void onUserLoggedOut() {
    debugPrint('SyncService: User logged out');
    _stopRealtimeListeners();
    _hasPerformedInitialSync = false;
    progress.value = SyncProgress.idle();
  }

  /// Clean up resources
  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    _supplierSync.dispose();
    _productSync.dispose();
    _notesSync.dispose();
    _documentSync.dispose();
    super.onClose();
  }
}
