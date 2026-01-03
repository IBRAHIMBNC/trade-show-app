import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/services/sync/file_sync_helper.dart';

/// Callback type for reporting sync progress
typedef SyncProgressCallback = void Function(int current, int total);

/// Abstract base class for table-specific sync services
/// Implements common sync logic with last-write-wins conflict resolution
abstract class BaseSyncService<TLocal, TRemote> {
  final AppDatabase database;
  final SupabaseClient supabaseClient;
  final FileSyncHelper fileSyncHelper;

  /// Supabase table name
  abstract final String tableName;

  /// Supabase Realtime channel for this table
  RealtimeChannel? _realtimeChannel;

  /// Stream subscription for local database changes
  StreamSubscription? _localWatchSubscription;

  /// Flag to prevent re-entrant sync operations
  bool _isSyncing = false;

  BaseSyncService({
    required this.database,
    required this.supabaseClient,
    FileSyncHelper? fileSyncHelper,
  }) : fileSyncHelper = fileSyncHelper ?? FileSyncHelper();

  // ============================================
  // Abstract methods to be implemented by subclasses
  // ============================================

  /// Get all local records that need to be synced (isSynced = false, deletedAt = null)
  Future<List<TLocal>> getUnsyncedRecords();

  /// Get all local records (for initial sync comparison)
  Future<List<TLocal>> getAllLocalRecords();

  /// Get a local record by its remote ID
  Future<TLocal?> getLocalByRemoteId(String remoteId);

  /// Get a local record by its local ID
  Future<TLocal?> getLocalById(int localId);

  /// Convert local record to remote format for upload
  Future<Map<String, dynamic>> localToRemote(TLocal local);

  /// Convert remote record to local format for insert/update
  Future<TLocal> remoteToLocal(Map<String, dynamic> remote);

  /// Insert a new local record (from remote)
  Future<int> insertLocal(TLocal record);

  /// Update an existing local record
  Future<void> updateLocal(TLocal record);

  /// Mark a local record as synced with the given remote ID
  Future<void> markAsSynced(int localId, String remoteId);

  /// Soft delete a local record
  Future<void> softDeleteLocal(int localId);

  /// Get the local ID from a record
  int getLocalId(TLocal record);

  /// Get the remote ID from a local record (may be null if not synced)
  String? getRemoteId(TLocal record);

  /// Get the updatedAt timestamp from a local record
  DateTime? getLocalUpdatedAt(TLocal record);

  /// Get the deletedAt timestamp from a local record
  DateTime? getLocalDeletedAt(TLocal record);

  /// Watch local table for changes (returns a stream)
  Stream<List<TLocal>> watchLocalChanges();

  /// Handle file uploads for a record (override if table has files)
  Future<Map<String, dynamic>> uploadFilesForRecord(
    TLocal record,
    Map<String, dynamic> remoteData,
  ) async {
    return remoteData; // Default: no file handling
  }

  /// Handle file downloads for a record (override if table has files)
  Future<TLocal> downloadFilesForRecord(
    TLocal record,
    Map<String, dynamic> remoteData,
  ) async {
    return record; // Default: no file handling
  }

  /// Get the user ID for filtering records
  String? get currentUserId => supabaseClient.auth.currentUser?.id;

  // ============================================
  // Sync Operations
  // ============================================

  /// Sync all unsynced local records to remote
  Future<void> syncUnsynced({SyncProgressCallback? onProgress}) async {
    if (_isSyncing) {
      debugPrint('$tableName: Sync already in progress, skipping');
      return;
    }

    _isSyncing = true;
    try {
      final unsyncedRecords = await getUnsyncedRecords();
      final total = unsyncedRecords.length;

      debugPrint('$tableName: Found $total unsynced records');

      for (var i = 0; i < unsyncedRecords.length; i++) {
        final record = unsyncedRecords[i];
        onProgress?.call(i + 1, total);

        try {
          await pushToRemote(record);
        } catch (e) {
          debugPrint(
            '$tableName: Error syncing record ${getLocalId(record)}: $e',
          );
        }
      }

      debugPrint('$tableName: Completed syncing $total records');
    } finally {
      _isSyncing = false;
    }
  }

  /// Push a single local record to remote
  Future<void> pushToRemote(TLocal record) async {
    final localId = getLocalId(record);
    final existingRemoteId = getRemoteId(record);
    final deletedAt = getLocalDeletedAt(record);

    // Convert to remote format and upload any files
    var remoteData = await localToRemote(record);
    remoteData = await uploadFilesForRecord(record, remoteData);

    if (deletedAt != null) {
      // Soft delete on remote
      if (existingRemoteId != null) {
        await supabaseClient
            .from(tableName)
            .update({'deleted_at': deletedAt.toIso8601String()})
            .eq('id', existingRemoteId);
        await markAsSynced(localId, existingRemoteId);
        debugPrint('$tableName: Soft deleted remote record $existingRemoteId');
      }
    } else if (existingRemoteId != null) {
      // Update existing remote record
      await supabaseClient
          .from(tableName)
          .update(remoteData)
          .eq('id', existingRemoteId);
      await markAsSynced(localId, existingRemoteId);
      debugPrint('$tableName: Updated remote record $existingRemoteId');
    } else {
      // Insert new remote record
      final response = await supabaseClient
          .from(tableName)
          .insert(remoteData)
          .select('id')
          .single();

      final newRemoteId = response['id'] as String;
      await markAsSynced(localId, newRemoteId);
      debugPrint('$tableName: Created remote record $newRemoteId');
    }
  }

  /// Pull all records from remote and merge with local
  Future<void> pullFromRemote({SyncProgressCallback? onProgress}) async {
    if (_isSyncing) {
      debugPrint('$tableName: Sync already in progress, skipping');
      return;
    }

    _isSyncing = true;
    try {
      final userId = currentUserId;
      if (userId == null) {
        debugPrint('$tableName: No user logged in, skipping pull');
        return;
      }

      // Fetch all records for current user (including soft-deleted for sync)
      final remoteRecords = await supabaseClient
          .from(tableName)
          .select()
          .eq('user_id', userId);

      final total = remoteRecords.length;
      debugPrint('$tableName: Found $total remote records');

      for (var i = 0; i < remoteRecords.length; i++) {
        final remoteData = remoteRecords[i];
        onProgress?.call(i + 1, total);

        try {
          await mergeRemoteRecord(remoteData);
        } catch (e) {
          debugPrint(
            '$tableName: Error merging record ${remoteData['id']}: $e',
          );
        }
      }

      debugPrint('$tableName: Completed pulling $total records');
    } finally {
      _isSyncing = false;
    }
  }

  /// Merge a single remote record with local data using last-write-wins
  Future<void> mergeRemoteRecord(Map<String, dynamic> remoteData) async {
    final remoteId = remoteData['id'] as String;
    final remoteUpdatedAt = remoteData['updated_at'] != null
        ? DateTime.parse(remoteData['updated_at'] as String)
        : null;
    final remoteDeletedAt = remoteData['deleted_at'] != null
        ? DateTime.parse(remoteData['deleted_at'] as String)
        : null;

    // Check if we have this record locally
    final existingLocal = await getLocalByRemoteId(remoteId);

    if (existingLocal != null) {
      final localUpdatedAt = getLocalUpdatedAt(existingLocal);
      final localDeletedAt = getLocalDeletedAt(existingLocal);

      // Last-write-wins conflict resolution
      if (remoteUpdatedAt != null && localUpdatedAt != null) {
        if (remoteUpdatedAt.isBefore(localUpdatedAt)) {
          // Local is newer, skip remote update (local will push later)
          debugPrint(
            '$tableName: Local record is newer, skipping remote update',
          );
          return;
        }
      }

      // Remote wins - update local
      if (remoteDeletedAt != null && localDeletedAt == null) {
        // Remote was deleted, soft delete local
        await softDeleteLocal(getLocalId(existingLocal));
        debugPrint('$tableName: Soft deleted local record from remote');
      } else {
        // Update local with remote data
        var updatedRecord = await remoteToLocal(remoteData);
        updatedRecord = await downloadFilesForRecord(updatedRecord, remoteData);
        await updateLocal(updatedRecord);
        debugPrint('$tableName: Updated local record from remote');
      }
    } else if (remoteDeletedAt == null) {
      // New record from remote (not deleted), insert locally
      var newRecord = await remoteToLocal(remoteData);
      newRecord = await downloadFilesForRecord(newRecord, remoteData);
      await insertLocal(newRecord);
      debugPrint('$tableName: Inserted new local record from remote');
    }
  }

  /// Perform initial sync - full pull from remote
  Future<void> initialSync({SyncProgressCallback? onProgress}) async {
    debugPrint('$tableName: Starting initial sync');
    await pullFromRemote(onProgress: onProgress);
    await syncUnsynced(onProgress: onProgress);
    debugPrint('$tableName: Initial sync complete');
  }

  // ============================================
  // Realtime Subscription
  // ============================================

  /// Start listening to Supabase Realtime changes
  void startRealtimeListener() {
    final userId = currentUserId;
    if (userId == null) {
      debugPrint('$tableName: No user logged in, cannot start realtime');
      return;
    }

    stopRealtimeListener();

    _realtimeChannel = supabaseClient
        .channel('sync_$tableName')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: tableName,
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'user_id',
            value: userId,
          ),
          callback: (payload) {
            _handleRealtimeEvent(payload);
          },
        )
        .subscribe();

    debugPrint('$tableName: Started realtime listener');
  }

  /// Handle incoming realtime events
  void _handleRealtimeEvent(PostgresChangePayload payload) async {
    debugPrint('$tableName: Realtime event: ${payload.eventType}');

    try {
      switch (payload.eventType) {
        case PostgresChangeEvent.insert:
        case PostgresChangeEvent.update:
          if (payload.newRecord.isNotEmpty) {
            await mergeRemoteRecord(payload.newRecord);
          }
          break;
        case PostgresChangeEvent.delete:
          // Handle hard delete from remote (if needed)
          break;
        default:
          break;
      }
    } catch (e) {
      debugPrint('$tableName: Error handling realtime event: $e');
    }
  }

  /// Stop listening to Supabase Realtime changes
  void stopRealtimeListener() {
    if (_realtimeChannel != null) {
      supabaseClient.removeChannel(_realtimeChannel!);
      _realtimeChannel = null;
      debugPrint('$tableName: Stopped realtime listener');
    }
  }

  // ============================================
  // Local Watch (for pushing changes when online)
  // ============================================

  /// Start watching local changes to push to remote
  void startLocalWatcher(bool Function() isOnlineCheck) {
    stopLocalWatcher();

    _localWatchSubscription = watchLocalChanges().listen((records) async {
      if (!isOnlineCheck()) return;

      // Changes are detected but handled by syncUnsynced
      // This watcher is for future real-time local change detection
      debugPrint('$tableName: Detected ${records.length} local records');
    });

    debugPrint('$tableName: Started local watcher');
  }

  /// Stop watching local changes
  void stopLocalWatcher() {
    _localWatchSubscription?.cancel();
    _localWatchSubscription = null;
    debugPrint('$tableName: Stopped local watcher');
  }

  /// Clean up resources
  void dispose() {
    stopRealtimeListener();
    stopLocalWatcher();
  }
}
