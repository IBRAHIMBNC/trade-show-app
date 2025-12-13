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
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 3) {
          // Add imageLocalPath column when upgrading to version 3
          await m.addColumn(supplier, supplier.imageLocalPath);
        }
        if (from < 4) {
          // Add ProductTable when upgrading to version 4
          await m.createTable(productTable);
        }
        if (from < 5) {
          // Add NotesTable and DocumentTable when upgrading to version 5
          await m.createTable(notesTable);
          await m.createTable(documentTable);
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
