import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/extensions/string.dart';
import 'package:supplier_snap/app/core/services/sync/base_sync_service.dart';
import 'package:supplier_snap/app/core/services/sync/supplier_sync_service.dart';

/// Sync service for the Document table
class DocumentSyncService
    extends BaseSyncService<DocumentTableData, Map<String, dynamic>> {
  @override
  final String tableName = 'documents';

  final SupplierSyncService supplierSyncService;

  DocumentSyncService({
    required super.database,
    required super.supabaseClient,
    required this.supplierSyncService,
    super.fileSyncHelper,
  });

  @override
  Future<List<DocumentTableData>> getUnsyncedRecords() async {
    return await (database.select(
      database.documentTable,
    )..where((tbl) => tbl.isSynced.equals(false))).get();
  }

  @override
  Future<List<DocumentTableData>> getAllLocalRecords() async {
    return await (database.select(
      database.documentTable,
    )..where((tbl) => tbl.deletedAt.isNull())).get();
  }

  @override
  Future<DocumentTableData?> getLocalByRemoteId(String remoteId) async {
    return await (database.select(
      database.documentTable,
    )..where((tbl) => tbl.remoteId.equals(remoteId))).getSingleOrNull();
  }

  @override
  Future<DocumentTableData?> getLocalById(int localId) async {
    return await (database.select(
      database.documentTable,
    )..where((tbl) => tbl.id.equals(localId))).getSingleOrNull();
  }

  @override
  Future<Map<String, dynamic>> localToRemote(DocumentTableData local) async {
    // Get the remote supplier ID for the foreign key
    String? remoteSupplierID;
    if (local.supplierId != null) {
      remoteSupplierID = await supplierSyncService.getRemoteIdByLocalId(
        local.supplierId!,
      );
    }

    if (remoteSupplierID == null) {
      debugPrint(
        '$tableName: Cannot sync document "${local.title}" (ID: ${local.id}) - '
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
      'url': local.url,
      'type': local.type,
      'created_at': local.createdAt.toIso8601String(),
      'updated_at':
          local.updatedAt?.toIso8601String() ??
          DateTime.now().toIso8601String(),
      'deleted_at': local.deletedAt?.toIso8601String(),
    };
  }

  @override
  Future<DocumentTableData> remoteToLocal(Map<String, dynamic> remote) async {
    // Get the local supplier ID from the remote supplier ID
    final remoteSupplierID = remote['supplier_id'] as String?;
    int? localSupplierId;
    if (remoteSupplierID != null) {
      localSupplierId = await supplierSyncService.getLocalIdByRemoteId(
        remoteSupplierID,
      );
    }

    return DocumentTableData(
      id: -1, // Will be assigned by database
      title: remote['title'] as String,
      localPath: '', // Will be set after download
      url: remote['url'] as String?,
      type: remote['type'] as String,
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
  Future<int> insertLocal(DocumentTableData record) async {
    return await database
        .into(database.documentTable)
        .insert(
          DocumentTableCompanion(
            title: Value(record.title),
            localPath: Value(record.localPath),
            url: Value(record.url),
            type: Value(record.type),
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
  Future<void> updateLocal(DocumentTableData record) async {
    final existingRecord = await getLocalByRemoteId(record.remoteId!);
    if (existingRecord == null) return;

    await (database.update(
      database.documentTable,
    )..where((tbl) => tbl.remoteId.equals(record.remoteId!))).write(
      DocumentTableCompanion(
        title: Value(record.title),
        localPath: Value(
          record.localPath.isNotEmpty
              ? record.localPath
              : existingRecord.localPath,
        ),
        url: Value(record.url),
        type: Value(record.type),
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
      database.documentTable,
    )..where((tbl) => tbl.id.equals(localId))).write(
      DocumentTableCompanion(
        isSynced: const Value(true),
        remoteId: Value(remoteId),
      ),
    );
  }

  @override
  Future<void> softDeleteLocal(int localId) async {
    await (database.update(
      database.documentTable,
    )..where((tbl) => tbl.id.equals(localId))).write(
      DocumentTableCompanion(
        deletedAt: Value(DateTime.now()),
        isSynced: const Value(false),
      ),
    );
  }

  @override
  int getLocalId(DocumentTableData record) => record.id;

  @override
  String? getRemoteId(DocumentTableData record) => record.remoteId;

  @override
  DateTime? getLocalUpdatedAt(DocumentTableData record) => record.updatedAt;

  @override
  DateTime? getLocalDeletedAt(DocumentTableData record) => record.deletedAt;

  @override
  Stream<List<DocumentTableData>> watchLocalChanges() {
    return database.select(database.documentTable).watch();
  }

  @override
  Future<Map<String, dynamic>> uploadFilesForRecord(
    DocumentTableData record,
    Map<String, dynamic> remoteData,
  ) async {
    // Upload document file if it exists locally
    if (record.localPath.isNotEmpty) {
      try {
        debugPrint(
          '$tableName: Uploading document ${record.title} from ${record.localPath}',
        );
        final uploadedUrl = await fileSyncHelper.uploadFile(
          localPath: record.localPath.toAbsolutePath,
          bucket: 'documents',
        );
        if (uploadedUrl != null) {
          remoteData['url'] = uploadedUrl;
          // Update local record with new URL
          await (database.update(database.documentTable)
                ..where((tbl) => tbl.id.equals(record.id)))
              .write(DocumentTableCompanion(url: Value(uploadedUrl)));
          debugPrint(
            '$tableName: Successfully uploaded document: $uploadedUrl',
          );
        } else {
          debugPrint(
            '$tableName: Failed to upload document ${record.title} - uploadFile returned null',
          );
        }
      } catch (e) {
        debugPrint('$tableName: Error uploading document: $e');
      }
    }
    return remoteData;
  }

  @override
  Future<DocumentTableData> downloadFilesForRecord(
    DocumentTableData record,
    Map<String, dynamic> remoteData,
  ) async {
    // Download document file if it exists remotely but not locally
    final remoteUrl = remoteData['url'] as String?;
    if (remoteUrl != null && remoteUrl.isNotEmpty && record.localPath.isEmpty) {
      final localPath = await fileSyncHelper.downloadFile(
        remoteUrl: remoteUrl,
        subDirectory: 'documents',
      );
      if (localPath != null) {
        return DocumentTableData(
          id: record.id,
          title: record.title,
          localPath: localPath,
          url: remoteUrl,
          type: record.type,
          createdAt: record.createdAt,
          supplierId: record.supplierId,
          isSynced: record.isSynced,
          updatedAt: record.updatedAt,
          remoteId: record.remoteId,
          deletedAt: record.deletedAt,
        );
      }
    }
    return record;
  }
}
