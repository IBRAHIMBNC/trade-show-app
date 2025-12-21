import 'package:drift/drift.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';

class SupplierInfoService {
  final AppDatabase database = Get.find();

  SupplierInfoService._();

  static SupplierInfoService get instance => SupplierInfoService._();

  /// Get product count for a supplier (EFFICIENT - count only, no data loading)
  Future<int> getProductCountBySupplierId(int supplierId) async {
    final countQuery = database.selectOnly(database.productTable)
      ..addColumns([database.productTable.id.count()])
      ..where(database.productTable.supplierId.equals(supplierId));

    final result = await countQuery.getSingle();
    return result.read(database.productTable.id.count()) ?? 0;
  }

  /// Watch product count for a supplier (REACTIVE)
  Stream<int> watchProductCountBySupplierId(int supplierId) {
    final countQuery = database.selectOnly(database.productTable)
      ..addColumns([database.productTable.id.count()])
      ..where(database.productTable.supplierId.equals(supplierId));

    return countQuery.watchSingle().map(
      (row) => row.read(database.productTable.id.count()) ?? 0,
    );
  }

  /// Notes Count

  /// Get note count for a supplier (EFFICIENT)
  Future<int> getNoteCountBySupplierId(int supplierId) async {
    final countQuery = database.selectOnly(database.notesTable)
      ..addColumns([database.notesTable.id.count()])
      ..where(database.notesTable.supplierId.equals(supplierId));

    final result = await countQuery.getSingle();
    return result.read(database.notesTable.id.count()) ?? 0;
  }

  /// Watch note count for a supplier (REACTIVE)
  Stream<int> watchNoteCountBySupplierId(int supplierId) {
    final countQuery = database.selectOnly(database.notesTable)
      ..addColumns([database.notesTable.id.count()])
      ..where(database.notesTable.supplierId.equals(supplierId));

    return countQuery.watchSingle().map(
      (row) => row.read(database.notesTable.id.count()) ?? 0,
    );
  }

  /// Documents Count

  /// Watch document count for a supplier (REACTIVE)
  Stream<int> watchDocumentCountBySupplierId(int supplierId) {
    final countQuery = database.selectOnly(database.documentTable)
      ..addColumns([database.documentTable.id.count()])
      ..where(database.documentTable.supplierId.equals(supplierId));

    return countQuery.watchSingle().map(
      (row) => row.read(database.documentTable.id.count()) ?? 0,
    );
  }

  /// Get a single document by ID
  Future<DocumentTableData?> getDocumentById(int id) async {
    return await (database.select(
      database.documentTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }
}
