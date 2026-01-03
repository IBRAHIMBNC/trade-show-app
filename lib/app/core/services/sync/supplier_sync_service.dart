import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/extensions/string.dart';
import 'package:supplier_snap/app/core/services/sync/base_sync_service.dart';

/// Sync service for the Supplier table
class SupplierSyncService
    extends BaseSyncService<SupplierData, Map<String, dynamic>> {
  @override
  final String tableName = 'suppliers';

  SupplierSyncService({
    required super.database,
    required super.supabaseClient,
    super.fileSyncHelper,
  });

  @override
  Future<List<SupplierData>> getUnsyncedRecords() async {
    return await (database.select(
      database.supplier,
    )..where((tbl) => tbl.isSynced.equals(false))).get();
  }

  @override
  Future<List<SupplierData>> getAllLocalRecords() async {
    final userId = currentUserId;
    if (userId == null) return [];
    return await (database.select(database.supplier)
          ..where((tbl) => tbl.userId.equals(userId))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();
  }

  @override
  Future<SupplierData?> getLocalByRemoteId(String remoteId) async {
    return await (database.select(
      database.supplier,
    )..where((tbl) => tbl.remoteId.equals(remoteId))).getSingleOrNull();
  }

  @override
  Future<SupplierData?> getLocalById(int localId) async {
    return await (database.select(
      database.supplier,
    )..where((tbl) => tbl.id.equals(localId))).getSingleOrNull();
  }

  @override
  Future<Map<String, dynamic>> localToRemote(SupplierData local) async {
    return {
      'user_id': local.userId,
      'name': local.name,
      'company': local.company,
      'booth': local.booth,
      'address': local.address,
      'email': local.email,
      'phone': local.phone,
      'we_chat_id': local.weChatID,
      'whats_app_number': local.whatsAppNumber,
      'notes': local.notes,
      'industry': local.industry,
      'interest_level': local.interestLevel,
      'image_url': local.imageUrl,
      'scores': local.scores,
      'product_type': local.productType,
      'created_at': local.createdAt,
      'updated_at': local.updatedAt ?? DateTime.now().toIso8601String(),
      'deleted_at': local.deletedAt?.toIso8601String(),
    };
  }

  @override
  Future<SupplierData> remoteToLocal(Map<String, dynamic> remote) async {
    return SupplierData(
      id: -1, // Will be assigned by database
      userId: remote['user_id'] as String,
      name: remote['name'] as String,
      company: remote['company'] as String,
      booth: remote['booth'] as String,
      address: remote['address'] as String?,
      email: remote['email'] as String?,
      phone: remote['phone'] as String?,
      weChatID: remote['we_chat_id'] as String?,
      whatsAppNumber: remote['whats_app_number'] as String?,
      notes: remote['notes'] as String?,
      industry: remote['industry'] as String?,
      interestLevel: remote['interest_level'] as String?,
      imageUrl: remote['image_url'] as String?,
      imageLocalPath: null, // Will be set after download
      createdAt: remote['created_at'] as String?,
      updatedAt: remote['updated_at'] as String?,
      isSynced: true,
      scores: remote['scores'] != null
          ? Map<String, String>.from(remote['scores'] as Map)
          : null,
      productType: remote['product_type'] as String?,
      remoteId: remote['id'] as String,
      deletedAt: remote['deleted_at'] != null
          ? DateTime.parse(remote['deleted_at'] as String)
          : null,
    );
  }

  @override
  Future<int> insertLocal(SupplierData record) async {
    return await database
        .into(database.supplier)
        .insert(
          SupplierCompanion(
            userId: Value(record.userId),
            name: Value(record.name),
            company: Value(record.company),
            booth: Value(record.booth),
            address: Value(record.address),
            email: Value(record.email),
            phone: Value(record.phone),
            weChatID: Value(record.weChatID),
            whatsAppNumber: Value(record.whatsAppNumber),
            notes: Value(record.notes),
            industry: Value(record.industry),
            interestLevel: Value(record.interestLevel),
            imageUrl: Value(record.imageUrl),
            imageLocalPath: Value(record.imageLocalPath),
            createdAt: Value(record.createdAt),
            updatedAt: Value(record.updatedAt),
            isSynced: const Value(true),
            scores: Value(record.scores),
            productType: Value(record.productType),
            remoteId: Value(record.remoteId),
            deletedAt: Value(record.deletedAt),
          ),
        );
  }

  @override
  Future<void> updateLocal(SupplierData record) async {
    final existingRecord = await getLocalByRemoteId(record.remoteId!);
    if (existingRecord == null) return;

    await (database.update(
      database.supplier,
    )..where((tbl) => tbl.remoteId.equals(record.remoteId!))).write(
      SupplierCompanion(
        userId: Value(record.userId),
        name: Value(record.name),
        company: Value(record.company),
        booth: Value(record.booth),
        address: Value(record.address),
        email: Value(record.email),
        phone: Value(record.phone),
        weChatID: Value(record.weChatID),
        whatsAppNumber: Value(record.whatsAppNumber),
        notes: Value(record.notes),
        industry: Value(record.industry),
        interestLevel: Value(record.interestLevel),
        imageUrl: Value(record.imageUrl),
        imageLocalPath: Value(
          record.imageLocalPath ?? existingRecord.imageLocalPath,
        ),
        createdAt: Value(record.createdAt),
        updatedAt: Value(record.updatedAt),
        isSynced: const Value(true),
        scores: Value(record.scores),
        productType: Value(record.productType),
        deletedAt: Value(record.deletedAt),
      ),
    );
  }

  @override
  Future<void> markAsSynced(int localId, String remoteId) async {
    await (database.update(
      database.supplier,
    )..where((tbl) => tbl.id.equals(localId))).write(
      SupplierCompanion(isSynced: const Value(true), remoteId: Value(remoteId)),
    );
  }

  @override
  Future<void> softDeleteLocal(int localId) async {
    await (database.update(
      database.supplier,
    )..where((tbl) => tbl.id.equals(localId))).write(
      SupplierCompanion(
        deletedAt: Value(DateTime.now()),
        isSynced: const Value(false),
      ),
    );
  }

  @override
  int getLocalId(SupplierData record) => record.id;

  @override
  String? getRemoteId(SupplierData record) => record.remoteId;

  @override
  DateTime? getLocalUpdatedAt(SupplierData record) {
    if (record.updatedAt == null) return null;
    return DateTime.tryParse(record.updatedAt!);
  }

  @override
  DateTime? getLocalDeletedAt(SupplierData record) => record.deletedAt;

  @override
  Stream<List<SupplierData>> watchLocalChanges() {
    final userId = currentUserId;
    if (userId == null) return Stream.value([]);
    return (database.select(
      database.supplier,
    )..where((tbl) => tbl.userId.equals(userId))).watch();
  }

  @override
  Future<Map<String, dynamic>> uploadFilesForRecord(
    SupplierData record,
    Map<String, dynamic> remoteData,
  ) async {
    // Upload supplier profile image if exists locally
    if (record.imageLocalPath != null && record.imageLocalPath!.isNotEmpty) {
      try {
        debugPrint(
          '$tableName: Uploading image for ${record.name} from ${record.imageLocalPath}',
        );
        final uploadedUrl = await fileSyncHelper.uploadFile(
          localPath: record.imageLocalPath!.toAbsolutePath,
          bucket: 'supplier-images',
        );
        if (uploadedUrl != null) {
          remoteData['image_url'] = uploadedUrl;
          // Update local record with new URL
          await (database.update(database.supplier)
                ..where((tbl) => tbl.id.equals(record.id)))
              .write(SupplierCompanion(imageUrl: Value(uploadedUrl)));
          debugPrint(
            '$tableName: Successfully uploaded supplier image: $uploadedUrl',
          );
        } else {
          debugPrint(
            '$tableName: Failed to upload image for ${record.name} - uploadFile returned null',
          );
        }
      } catch (e) {
        debugPrint('$tableName: Error uploading supplier image: $e');
      }
    }
    return remoteData;
  }

  @override
  Future<SupplierData> downloadFilesForRecord(
    SupplierData record,
    Map<String, dynamic> remoteData,
  ) async {
    // Download supplier profile image if exists remotely but not locally
    final remoteImageUrl = remoteData['image_url'] as String?;
    if (remoteImageUrl != null &&
        remoteImageUrl.isNotEmpty &&
        (record.imageLocalPath == null || record.imageLocalPath!.isEmpty)) {
      final localPath = await fileSyncHelper.downloadFile(
        remoteUrl: remoteImageUrl,
        subDirectory: 'suppliers',
      );
      if (localPath != null) {
        // Return updated record with local path
        return SupplierData(
          id: record.id,
          userId: record.userId,
          name: record.name,
          company: record.company,
          booth: record.booth,
          address: record.address,
          email: record.email,
          phone: record.phone,
          weChatID: record.weChatID,
          whatsAppNumber: record.whatsAppNumber,
          notes: record.notes,
          industry: record.industry,
          interestLevel: record.interestLevel,
          imageUrl: remoteImageUrl,
          imageLocalPath: localPath,
          createdAt: record.createdAt,
          updatedAt: record.updatedAt,
          isSynced: record.isSynced,
          scores: record.scores,
          productType: record.productType,
          remoteId: record.remoteId,
          deletedAt: record.deletedAt,
        );
      }
    }
    return record;
  }

  /// Get the remote ID for a local supplier by local ID
  /// Useful for child tables to resolve foreign key references
  Future<String?> getRemoteIdByLocalId(int localId) async {
    final record = await getLocalById(localId);
    return record?.remoteId;
  }

  /// Get the local ID for a remote supplier by remote ID
  /// Useful for child tables to resolve foreign key references
  Future<int?> getLocalIdByRemoteId(String remoteId) async {
    final record = await getLocalByRemoteId(remoteId);
    return record?.id;
  }
}
