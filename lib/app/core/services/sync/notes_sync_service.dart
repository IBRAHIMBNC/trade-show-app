import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/services/sync/base_sync_service.dart';
import 'package:supplier_snap/app/core/services/sync/supplier_sync_service.dart';

/// Sync service for the Notes table
class NotesSyncService
    extends BaseSyncService<NotesTableData, Map<String, dynamic>> {
  @override
  final String tableName = 'notes';

  final SupplierSyncService supplierSyncService;

  NotesSyncService({
    required super.database,
    required super.supabaseClient,
    required this.supplierSyncService,
    super.fileSyncHelper,
  });

  @override
  Future<List<NotesTableData>> getUnsyncedRecords() async {
    return await (database.select(
      database.notesTable,
    )..where((tbl) => tbl.isSynced.equals(false))).get();
  }

  @override
  Future<List<NotesTableData>> getAllLocalRecords() async {
    return await (database.select(
      database.notesTable,
    )..where((tbl) => tbl.deletedAt.isNull())).get();
  }

  @override
  Future<NotesTableData?> getLocalByRemoteId(String remoteId) async {
    return await (database.select(
      database.notesTable,
    )..where((tbl) => tbl.remoteId.equals(remoteId))).getSingleOrNull();
  }

  @override
  Future<NotesTableData?> getLocalById(int localId) async {
    return await (database.select(
      database.notesTable,
    )..where((tbl) => tbl.id.equals(localId))).getSingleOrNull();
  }

  @override
  Future<Map<String, dynamic>> localToRemote(NotesTableData local) async {
    // Get the remote supplier ID for the foreign key
    String? remoteSupplierID;
    if (local.supplierId != null) {
      remoteSupplierID = await supplierSyncService.getRemoteIdByLocalId(
        local.supplierId!,
      );
    }

    if (remoteSupplierID == null) {
      debugPrint(
        '$tableName: Cannot sync note "${local.title}" (ID: ${local.id}) - '
        'Supplier (ID: ${local.supplierId}) has no remoteId (not synced yet)',
      );
      throw Exception(
        'Supplier not synced yet (supplierId: ${local.supplierId})',
      );
    }

    return {
      'user_id': currentUserId,
      'supplier_id': remoteSupplierID,
      'title': local.title,
      'content': local.content,
      'created_at': local.createdAt.toIso8601String(),
      'updated_at':
          local.updatedAt?.toIso8601String() ??
          DateTime.now().toIso8601String(),
      'deleted_at': local.deletedAt?.toIso8601String(),
    };
  }

  @override
  Future<NotesTableData> remoteToLocal(Map<String, dynamic> remote) async {
    // Get the local supplier ID from the remote supplier ID
    final remoteSupplierID = remote['supplier_id'] as String?;
    int? localSupplierId;
    if (remoteSupplierID != null) {
      localSupplierId = await supplierSyncService.getLocalIdByRemoteId(
        remoteSupplierID,
      );
    }

    return NotesTableData(
      id: -1, // Will be assigned by database
      title: remote['title'] as String,
      content: remote['content'] as String,
      createdAt: remote['created_at'] != null
          ? DateTime.parse(remote['created_at'] as String)
          : DateTime.now(),
      supplierId: localSupplierId,
      isSynced: true,
      updatedAt: remote['updated_at'] != null
          ? DateTime.parse(remote['updated_at'] as String)
          : null,
      remoteId: remote['id'] as String,
      deletedAt: remote['deleted_at'] != null
          ? DateTime.parse(remote['deleted_at'] as String)
          : null,
    );
  }

  @override
  Future<int> insertLocal(NotesTableData record) async {
    return await database
        .into(database.notesTable)
        .insert(
          NotesTableCompanion(
            title: Value(record.title),
            content: Value(record.content),
            createdAt: Value(record.createdAt),
            supplierId: Value(record.supplierId),
            isSynced: const Value(true),
            updatedAt: Value(record.updatedAt),
            remoteId: Value(record.remoteId),
            deletedAt: Value(record.deletedAt),
          ),
        );
  }

  @override
  Future<void> updateLocal(NotesTableData record) async {
    final existingRecord = await getLocalByRemoteId(record.remoteId!);
    if (existingRecord == null) return;

    await (database.update(
      database.notesTable,
    )..where((tbl) => tbl.remoteId.equals(record.remoteId!))).write(
      NotesTableCompanion(
        title: Value(record.title),
        content: Value(record.content),
        createdAt: Value(record.createdAt),
        supplierId: Value(record.supplierId),
        isSynced: const Value(true),
        updatedAt: Value(record.updatedAt),
        deletedAt: Value(record.deletedAt),
      ),
    );
  }

  @override
  Future<void> markAsSynced(int localId, String remoteId) async {
    await (database.update(
      database.notesTable,
    )..where((tbl) => tbl.id.equals(localId))).write(
      NotesTableCompanion(
        isSynced: const Value(true),
        remoteId: Value(remoteId),
      ),
    );
  }

  @override
  Future<void> softDeleteLocal(int localId) async {
    await (database.update(
      database.notesTable,
    )..where((tbl) => tbl.id.equals(localId))).write(
      NotesTableCompanion(
        deletedAt: Value(DateTime.now()),
        isSynced: const Value(false),
      ),
    );
  }

  @override
  int getLocalId(NotesTableData record) => record.id;

  @override
  String? getRemoteId(NotesTableData record) => record.remoteId;

  @override
  DateTime? getLocalUpdatedAt(NotesTableData record) => record.updatedAt;

  @override
  DateTime? getLocalDeletedAt(NotesTableData record) => record.deletedAt;

  @override
  Stream<List<NotesTableData>> watchLocalChanges() {
    return database.select(database.notesTable).watch();
  }

  // Notes have no files, so we don't override upload/download methods
}
