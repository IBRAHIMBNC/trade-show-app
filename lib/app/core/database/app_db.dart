import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supplier_snap/app/core/database/tables/documents_table.dart';
import 'package:supplier_snap/app/core/database/tables/notes_table.dart';
import 'package:supplier_snap/app/core/database/tables/product_table.dart';
import 'package:supplier_snap/app/core/database/tables/supplier_table.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [Supplier, ProductTable, NotesTable, DocumentTable])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 3) {
          // Add sync columns: remoteId, deletedAt to all tables
          // Add updatedAt to tables that don't have it

          // Supplier table - already has updatedAt as text, add remoteId and deletedAt
          await m.addColumn(supplier, supplier.remoteId);
          await m.addColumn(supplier, supplier.deletedAt);

          // ProductTable - add updatedAt, remoteId, deletedAt
          await m.addColumn(productTable, productTable.updatedAt);
          await m.addColumn(productTable, productTable.remoteId);
          await m.addColumn(productTable, productTable.deletedAt);

          // NotesTable - add updatedAt, remoteId, deletedAt
          await m.addColumn(notesTable, notesTable.updatedAt);
          await m.addColumn(notesTable, notesTable.remoteId);
          await m.addColumn(notesTable, notesTable.deletedAt);

          // DocumentTable - add updatedAt, remoteId, deletedAt
          await m.addColumn(documentTable, documentTable.updatedAt);
          await m.addColumn(documentTable, documentTable.remoteId);
          await m.addColumn(documentTable, documentTable.deletedAt);
        }
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
