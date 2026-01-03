import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/extensions/string.dart';
import 'package:supplier_snap/app/core/services/sync/base_sync_service.dart';
import 'package:supplier_snap/app/core/services/sync/supplier_sync_service.dart';

/// Sync service for the Product table
class ProductSyncService
    extends BaseSyncService<ProductTableData, Map<String, dynamic>> {
  @override
  final String tableName = 'products';

  final SupplierSyncService supplierSyncService;

  ProductSyncService({
    required super.database,
    required super.supabaseClient,
    required this.supplierSyncService,
    super.fileSyncHelper,
  });

  @override
  Future<List<ProductTableData>> getUnsyncedRecords() async {
    return await (database.select(
      database.productTable,
    )..where((tbl) => tbl.isSynced.equals(false))).get();
  }

  @override
  Future<List<ProductTableData>> getAllLocalRecords() async {
    return await (database.select(
      database.productTable,
    )..where((tbl) => tbl.deletedAt.isNull())).get();
  }

  @override
  Future<ProductTableData?> getLocalByRemoteId(String remoteId) async {
    return await (database.select(
      database.productTable,
    )..where((tbl) => tbl.remoteId.equals(remoteId))).getSingleOrNull();
  }

  @override
  Future<ProductTableData?> getLocalById(int localId) async {
    return await (database.select(
      database.productTable,
    )..where((tbl) => tbl.id.equals(localId))).getSingleOrNull();
  }

  @override
  Future<Map<String, dynamic>> localToRemote(ProductTableData local) async {
    // Get the remote supplier ID for the foreign key
    String? remoteSupplierID;
    if (local.supplierId != null) {
      remoteSupplierID = await supplierSyncService.getRemoteIdByLocalId(
        local.supplierId!,
      );
    }

    if (remoteSupplierID == null) {
      debugPrint(
        '$tableName: Cannot sync product "${local.name}" (ID: ${local.id}) - '
        'Supplier (ID: ${local.supplierId}) has no remoteId (not synced yet)',
      );
      throw Exception(
        'Supplier not synced yet (supplierId: ${local.supplierId})',
      );
    }

    return {
      'user_id': currentUserId,
      'supplier_id': remoteSupplierID,
      'name': local.name,
      'price': local.price,
      'specifications': local.specifications,
      'notes': local.notes,
      'category': local.category,
      'lead_time_days': local.leadTimeDays,
      'moq': local.moq,
      'moq_unit': local.moqUnit,
      'image_urls': local.imageUrls ?? [],
      'certifications': local.certifications,
      'created_at': local.createdAt.toIso8601String(),
      'updated_at':
          local.updatedAt?.toIso8601String() ??
          DateTime.now().toIso8601String(),
      'deleted_at': local.deletedAt?.toIso8601String(),
    };
  }

  @override
  Future<ProductTableData> remoteToLocal(Map<String, dynamic> remote) async {
    // Get the local supplier ID from the remote supplier ID
    final remoteSupplierID = remote['supplier_id'] as String?;
    int? localSupplierId;
    if (remoteSupplierID != null) {
      localSupplierId = await supplierSyncService.getLocalIdByRemoteId(
        remoteSupplierID,
      );
    }

    return ProductTableData(
      id: -1, // Will be assigned by database
      name: remote['name'] as String,
      price: (remote['price'] as num).toDouble(),
      specifications: remote['specifications'] as String?,
      notes: remote['notes'] as String?,
      createdAt: remote['created_at'] != null
          ? DateTime.parse(remote['created_at'] as String)
          : DateTime.now(),
      category: remote['category'] as String?,
      leadTimeDays: remote['lead_time_days'] as int?,
      supplierId: localSupplierId,
      moq: remote['moq'] as int?,
      moqUnit: remote['moq_unit'] as String?,
      imageLocalPaths: null, // Will be set after download
      imageUrls: remote['image_urls'] != null
          ? List<String>.from(remote['image_urls'] as List)
          : null,
      certifications: remote['certifications'] as String?,
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
  Future<int> insertLocal(ProductTableData record) async {
    return await database
        .into(database.productTable)
        .insert(
          ProductTableCompanion(
            name: Value(record.name),
            price: Value(record.price),
            specifications: Value(record.specifications),
            notes: Value(record.notes),
            createdAt: Value(record.createdAt),
            category: Value(record.category),
            leadTimeDays: Value(record.leadTimeDays),
            supplierId: Value(record.supplierId),
            moq: Value(record.moq),
            moqUnit: Value(record.moqUnit),
            imageLocalPaths: Value(record.imageLocalPaths),
            imageUrls: Value(record.imageUrls),
            certifications: Value(record.certifications),
            isSynced: const Value(true),
            updatedAt: Value(record.updatedAt),
            remoteId: Value(record.remoteId),
            deletedAt: Value(record.deletedAt),
          ),
        );
  }

  @override
  Future<void> updateLocal(ProductTableData record) async {
    final existingRecord = await getLocalByRemoteId(record.remoteId!);
    if (existingRecord == null) return;

    await (database.update(
      database.productTable,
    )..where((tbl) => tbl.remoteId.equals(record.remoteId!))).write(
      ProductTableCompanion(
        name: Value(record.name),
        price: Value(record.price),
        specifications: Value(record.specifications),
        notes: Value(record.notes),
        createdAt: Value(record.createdAt),
        category: Value(record.category),
        leadTimeDays: Value(record.leadTimeDays),
        supplierId: Value(record.supplierId),
        moq: Value(record.moq),
        moqUnit: Value(record.moqUnit),
        imageLocalPaths: Value(
          record.imageLocalPaths ?? existingRecord.imageLocalPaths,
        ),
        imageUrls: Value(record.imageUrls),
        certifications: Value(record.certifications),
        isSynced: const Value(true),
        updatedAt: Value(record.updatedAt),
        deletedAt: Value(record.deletedAt),
      ),
    );
  }

  @override
  Future<void> markAsSynced(int localId, String remoteId) async {
    await (database.update(
      database.productTable,
    )..where((tbl) => tbl.id.equals(localId))).write(
      ProductTableCompanion(
        isSynced: const Value(true),
        remoteId: Value(remoteId),
      ),
    );
  }

  @override
  Future<void> softDeleteLocal(int localId) async {
    await (database.update(
      database.productTable,
    )..where((tbl) => tbl.id.equals(localId))).write(
      ProductTableCompanion(
        deletedAt: Value(DateTime.now()),
        isSynced: const Value(false),
      ),
    );
  }

  @override
  int getLocalId(ProductTableData record) => record.id;

  @override
  String? getRemoteId(ProductTableData record) => record.remoteId;

  @override
  DateTime? getLocalUpdatedAt(ProductTableData record) => record.updatedAt;

  @override
  DateTime? getLocalDeletedAt(ProductTableData record) => record.deletedAt;

  @override
  Stream<List<ProductTableData>> watchLocalChanges() {
    return database.select(database.productTable).watch();
  }

  @override
  Future<Map<String, dynamic>> uploadFilesForRecord(
    ProductTableData record,
    Map<String, dynamic> remoteData,
  ) async {
    // Upload product images if they exist locally
    final localPaths = record.imageLocalPaths ?? [];

    if (localPaths.isNotEmpty) {
      try {
        debugPrint(
          '$tableName: Uploading ${localPaths.length} images for ${record.name}',
        );
        final uploadedUrls = <String>[];

        for (final localPath in localPaths) {
          final uploadedUrl = await fileSyncHelper.uploadFile(
            localPath: localPath.toAbsolutePath,
            bucket: 'product-images',
          );
          if (uploadedUrl != null) {
            uploadedUrls.add(uploadedUrl);
          } else {
            debugPrint('$tableName: Failed to upload image: $localPath');
          }
        }

        if (uploadedUrls.isNotEmpty) {
          remoteData['image_urls'] = uploadedUrls;
          // Update local record with new URLs
          await (database.update(database.productTable)
                ..where((tbl) => tbl.id.equals(record.id)))
              .write(ProductTableCompanion(imageUrls: Value(uploadedUrls)));
          debugPrint(
            '$tableName: Successfully uploaded ${uploadedUrls.length} images',
          );
        }
      } catch (e) {
        debugPrint('$tableName: Error uploading product images: $e');
      }
    }
    return remoteData;
  }

  @override
  Future<ProductTableData> downloadFilesForRecord(
    ProductTableData record,
    Map<String, dynamic> remoteData,
  ) async {
    // Download product images if they exist remotely but not locally
    final remoteUrls = remoteData['image_urls'] as List?;
    final localPaths = record.imageLocalPaths ?? [];

    if (remoteUrls != null && remoteUrls.isNotEmpty && localPaths.isEmpty) {
      final downloadedPaths = <String>[];

      for (final url in remoteUrls) {
        final localPath = await fileSyncHelper.downloadFile(
          remoteUrl: url as String,
          subDirectory: 'products',
        );
        if (localPath != null) {
          downloadedPaths.add(localPath);
        }
      }

      if (downloadedPaths.isNotEmpty) {
        return ProductTableData(
          id: record.id,
          name: record.name,
          price: record.price,
          specifications: record.specifications,
          notes: record.notes,
          createdAt: record.createdAt,
          category: record.category,
          leadTimeDays: record.leadTimeDays,
          supplierId: record.supplierId,
          moq: record.moq,
          moqUnit: record.moqUnit,
          imageLocalPaths: downloadedPaths,
          imageUrls: remoteUrls.cast<String>(),
          certifications: record.certifications,
          isSynced: record.isSynced,
          updatedAt: record.updatedAt,
          remoteId: record.remoteId,
          deletedAt: record.deletedAt,
        );
      }
    }
    return record;
  }

  /// Get the remote ID for a product by local ID
  Future<String?> getRemoteIdByLocalId(int localId) async {
    final record = await getLocalById(localId);
    return record?.remoteId;
  }

  /// Get the local ID for a product by remote ID
  Future<int?> getLocalIdByRemoteId(String remoteId) async {
    final record = await getLocalByRemoteId(remoteId);
    return record?.id;
  }
}
