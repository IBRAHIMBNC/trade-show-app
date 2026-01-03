import 'package:drift/drift.dart';
// ignore_for_file: unused_import
import 'package:supplier_snap/app/core/database/tables/supplier_table.dart';

class NotesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get content => text().withLength(min: 1, max: 10000)();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)(); // Note creation timestamp
  IntColumn get supplierId => integer().nullable().customConstraint(
    'REFERENCES supplier(id) ON DELETE CASCADE NOT NULL',
  )();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  // Sync columns
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get remoteId => text().nullable()(); // UUID from Supabase
  DateTimeColumn get deletedAt =>
      dateTime().nullable()(); // Soft delete timestamp
}
