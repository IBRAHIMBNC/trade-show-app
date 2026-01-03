import 'package:drift/drift.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';

class SupplierLocalDatasource {
  final AppDatabase database;

  SupplierLocalDatasource({required this.database});

  /// Insert a new supplier into local database
  Future<int> insertSupplier(SupplierModel supplier) async {
    final now = DateTime.now();
    return await database
        .into(database.supplier)
        .insert(
          SupplierCompanion(
            userId: Value(supplier.userId),
            name: Value(supplier.name),
            company: Value(supplier.company),
            booth: Value(supplier.booth),
            address: Value(supplier.address),
            email: Value(supplier.email),
            phone: Value(supplier.phone),
            weChatID: Value(supplier.weChatID),
            whatsAppNumber: Value(supplier.whatsAppNumber),
            notes: Value(supplier.notes),
            industry: Value(supplier.industry?.name),
            interestLevel: Value(supplier.interestLevel?.name),
            imageUrl: Value(supplier.imageUrl),
            imageLocalPath: Value(supplier.relativeImagePath),
            scores: Value(supplier.scores.toMap()),
            createdAt: Value(
              supplier.createdAt?.toIso8601String() ?? now.toIso8601String(),
            ),
            updatedAt: Value(now.toIso8601String()),
            productType: Value(supplier.productType?.name),
            isSynced: const Value(false), // Mark as unsynced for cloud sync
          ),
        );
  }

  /// Get all suppliers from local database (for current user and shared suppliers)
  /// Excludes soft-deleted records
  Future<List<SupplierData>> getAllSuppliers() async {
    return await (database.select(
      database.supplier,
    )..where((tbl) => tbl.deletedAt.isNull())).get();
  }

  /// Get suppliers by user ID (only suppliers added by specific user)
  /// Excludes soft-deleted records
  Future<List<SupplierData>> getSuppliersByUserId(String userId) async {
    return await (database.select(database.supplier)
          ..where((tbl) => tbl.userId.equals(userId))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();
  }

  /// Watch suppliers by user ID (Stream for real-time updates)
  /// Excludes soft-deleted records
  Stream<List<SupplierData>> watchSuppliersByUserId(String userId) {
    return (database.select(database.supplier)
          ..where((tbl) => tbl.userId.equals(userId))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .watch();
  }

  /// Get a single supplier by ID (excluding soft-deleted)
  Future<SupplierData?> getSupplierById(int id) async {
    return await (database.select(database.supplier)
          ..where((tbl) => tbl.id.equals(id))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .getSingleOrNull();
  }

  /// Update a supplier in local database
  Future<bool> updateSupplier(int id, SupplierModel supplier) async {
    final now = DateTime.now();
    return await database
        .update(database.supplier)
        .replace(
          SupplierCompanion(
            id: Value(id),
            userId: Value(supplier.userId),
            name: Value(supplier.name),
            company: Value(supplier.company),
            booth: Value(supplier.booth),
            address: Value(supplier.address),
            email: Value(supplier.email),
            phone: Value(supplier.phone),
            weChatID: Value(supplier.weChatID),
            whatsAppNumber: Value(supplier.whatsAppNumber),
            notes: Value(supplier.notes),
            industry: Value(supplier.industry?.name),
            interestLevel: Value(supplier.interestLevel?.name),
            imageUrl: Value(supplier.imageUrl),
            imageLocalPath: Value(supplier.relativeImagePath),
            scores: Value(supplier.scores.toMap()),
            createdAt: Value(supplier.createdAt?.toIso8601String()),
            updatedAt: Value(now.toIso8601String()),
            productType: Value(supplier.productType?.name),
            isSynced: const Value(false), // Mark as unsynced for cloud sync
          ),
        );
  }

  /// Soft delete a supplier (mark as deleted instead of removing)
  Future<int> deleteSupplier(int id) async {
    final now = DateTime.now();

    // Soft delete related products
    await (database.update(
      database.productTable,
    )..where((tbl) => tbl.supplierId.equals(id))).write(
      ProductTableCompanion(
        deletedAt: Value(now),
        isSynced: const Value(false),
      ),
    );

    // Soft delete related notes
    await (database.update(
      database.notesTable,
    )..where((tbl) => tbl.supplierId.equals(id))).write(
      NotesTableCompanion(deletedAt: Value(now), isSynced: const Value(false)),
    );

    // Soft delete related documents
    await (database.update(
      database.documentTable,
    )..where((tbl) => tbl.supplierId.equals(id))).write(
      DocumentTableCompanion(
        deletedAt: Value(now),
        isSynced: const Value(false),
      ),
    );

    // Soft delete supplier
    return await (database.update(
      database.supplier,
    )..where((tbl) => tbl.id.equals(id))).write(
      SupplierCompanion(
        deletedAt: Value(now),
        updatedAt: Value(now.toIso8601String()),
        isSynced: const Value(false),
      ),
    );
  }

  /// Search suppliers by name or company (excluding soft-deleted)
  Future<List<SupplierData>> searchSuppliers(String query) async {
    final lowerQuery = query.toLowerCase();
    return await (database.select(database.supplier)
          ..where((tbl) => tbl.deletedAt.isNull())
          ..where(
            (tbl) =>
                tbl.name.lower().contains(lowerQuery) |
                tbl.company.lower().contains(lowerQuery),
          ))
        .get();
  }

  /// Clear all suppliers from local database
  Future<int> clearAllSuppliers() async {
    return await database.delete(database.supplier).go();
  }

  /// Sync suppliers - replace all with fresh data from server
  Future<void> syncSuppliers(List<SupplierModel> suppliers) async {
    await database.transaction(() async {
      // Clear existing data
      await database.delete(database.supplier).go();

      // Insert new data
      for (final supplier in suppliers) {
        await insertSupplier(supplier);
      }
    });
  }
}
