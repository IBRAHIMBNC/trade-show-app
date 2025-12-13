import 'dart:convert';

import 'package:drift/drift.dart';
// ignore_for_file: unused_import
import 'package:supplier_snap/app/core/database/tables/supplier_table.dart';

class ProductTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  RealColumn get price => real()();
  TextColumn get specifications => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get category => text().nullable().withLength(min: 1, max: 100)();
  IntColumn get leadTimeDays => integer().nullable()();
  IntColumn get supplierId => integer().nullable().customConstraint(
    'REFERENCES supplier(id) NOT NULL',
  )();
  IntColumn get moq => integer().nullable()();
  TextColumn get moqUnit => text().nullable().withLength(min: 1, max: 50)();

  // Store list of strings as JSON
  TextColumn get imageLocalPaths =>
      text().nullable().map(const StringListConverter())();

  TextColumn get imageUrls =>
      text().nullable().map(const StringListConverter())();

  TextColumn get certifications => text().nullable()();
}

// Converter to store List<String> as JSON in database
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    try {
      final list = json.decode(fromDb) as List;
      return list.map((e) => e.toString()).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  String toSql(List<String>? value) {
    return json.encode(value);
  }
}
