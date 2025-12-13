import 'package:drift/drift.dart';
// ignore_for_file: unused_import
import 'package:supplier_snap/app/core/database/tables/supplier_table.dart';

class DocumentTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get localPath => text()();
  TextColumn get url => text().nullable()();
  TextColumn get type => text().withLength(min: 1, max: 50)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get supplierId => integer().nullable().customConstraint(
    'REFERENCES supplier(id) NOT NULL',
  )();
}
