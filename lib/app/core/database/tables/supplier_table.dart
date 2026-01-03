import 'dart:convert';

import 'package:drift/drift.dart';

class Supplier extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId =>
      text().withLength(min: 1, max: 50)(); // User who added this supplier
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get company => text().withLength(min: 1, max: 100)();
  TextColumn get booth => text().withLength(min: 1, max: 50)();
  TextColumn get address => text().nullable().withLength(max: 200)();
  TextColumn get email => text().nullable().withLength(max: 100)();
  TextColumn get phone => text().nullable().withLength(max: 20)();
  TextColumn get weChatID => text().nullable().withLength(max: 50)();
  TextColumn get whatsAppNumber => text().nullable().withLength(max: 20)();
  TextColumn get notes => text().nullable().withLength(max: 500)();
  TextColumn get industry => text().nullable().withLength(max: 100)();
  TextColumn get interestLevel => text().nullable().withLength(max: 50)();
  TextColumn get imageUrl => text().nullable().withLength(max: 500)();
  TextColumn get imageLocalPath => text().nullable()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get updatedAt => text().nullable()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  TextColumn get scores => text().nullable().map(const StringMapConverter())();
  TextColumn get productType => text().nullable().withLength(max: 50)();

  // Sync columns
  TextColumn get remoteId => text().nullable()(); // UUID from Supabase
  DateTimeColumn get deletedAt =>
      dateTime().nullable()(); // Soft delete timestamp
}

class StringMapConverter extends TypeConverter<Map<String, String>, String> {
  const StringMapConverter();

  @override
  Map<String, String> fromSql(String fromDb) {
    try {
      final Map<String, dynamic> map = Map<String, dynamic>.from(
        jsonDecode(fromDb),
      );
      return map.map((key, value) => MapEntry(key, value.toString()));
    } catch (e) {
      return {};
    }
  }

  @override
  String toSql(Map<String, String>? value) {
    return jsonEncode(value);
  }
}
