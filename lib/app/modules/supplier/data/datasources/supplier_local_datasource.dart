import 'package:drift/drift.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';
import 'package:supplier_snap/app/utils/my_utils.dart';

class SupplierLocalDatasource {
  final AppDatabase database;

  SupplierLocalDatasource({required this.database});

  /// Insert a new supplier into local database
  Future<int> insertSupplier(SupplierModel supplier) async {
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
            imageLocalPath: Value(supplier.imageLocalPath),
            score: Value(supplier.score),
            createdAt: Value(supplier.createdAt?.toIso8601String()),
            updatedAt: Value(supplier.updatedAt?.toIso8601String()),
          ),
        );
  }

  /// Get all suppliers from local database (for current user and shared suppliers)
  Future<List<SupplierData>> getAllSuppliers() async {
    return await database.select(database.supplier).get();
  }

  /// Get suppliers by user ID (only suppliers added by specific user)
  Future<List<SupplierData>> getSuppliersByUserId(String userId) async {
    return await (database.select(
      database.supplier,
    )..where((tbl) => tbl.userId.equals(userId))).get();
  }

  /// Watch suppliers by user ID (Stream for real-time updates)
  Stream<List<SupplierData>> watchSuppliersByUserId(String userId) {
    return (database.select(
      database.supplier,
    )..where((tbl) => tbl.userId.equals(userId))).watch();
  }

  /// Get a single supplier by ID
  Future<SupplierData?> getSupplierById(int id) async {
    return await (database.select(
      database.supplier,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Update a supplier in local database
  Future<bool> updateSupplier(int id, SupplierModel supplier) async {
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
            imageLocalPath: Value(supplier.imageLocalPath),
            score: Value(supplier.score),
            createdAt: Value(supplier.createdAt?.toIso8601String()),
            updatedAt: Value(supplier.updatedAt?.toIso8601String()),
          ),
        );
  }

  /// Delete a supplier from local database
  Future<int> deleteSupplier(int id) async {
    final supplier = await getSupplierById(id);
    // Delete supplier image
    if (supplier != null && supplier.imageLocalPath != null) {
      MyUtils.deletePermanentFile(supplier.imageLocalPath!);
    }
    return await (database.delete(
      database.supplier,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  /// Search suppliers by name or company
  Future<List<SupplierData>> searchSuppliers(String query) async {
    final lowerQuery = query.toLowerCase();
    return await (database.select(database.supplier)..where(
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
