import 'package:drift/drift.dart';
// ignore_for_file: unused_import
import 'package:supplier_snap/app/core/database/tables/supplier_table.dart';

class NotesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get content => text().withLength(min: 1, max: 1000)();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)(); // Note creation timestamp
  IntColumn get supplierId => integer().nullable().customConstraint(
    'REFERENCES supplier(id) NOT NULL',
  )();
}
