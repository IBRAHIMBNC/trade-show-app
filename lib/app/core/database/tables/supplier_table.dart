import 'package:drift/drift.dart';

class Supplier extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId =>
      text().withLength(min: 1, max: 50)(); // User who added this supplier
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get company => text().withLength(min: 1, max: 100)();
  TextColumn get booth => text().withLength(min: 1, max: 50)();
  TextColumn get address => text().nullable().withLength(min: 1, max: 200)();
  TextColumn get email => text().nullable().withLength(min: 1, max: 100)();
  TextColumn get phone => text().nullable().withLength(min: 1, max: 15)();
  TextColumn get weChatID => text().nullable().withLength(min: 1, max: 50)();
  TextColumn get whatsAppNumber =>
      text().nullable().withLength(min: 1, max: 15)();
  TextColumn get notes => text().nullable().withLength(min: 1, max: 500)();
  TextColumn get industry => text().nullable().withLength(min: 1, max: 100)();
  TextColumn get interestLevel =>
      text().nullable().withLength(min: 1, max: 50)();
  TextColumn get imageUrl => text().nullable().withLength(min: 1, max: 500)();
  TextColumn get imageLocalPath => text().nullable()();
  IntColumn get score => integer().nullable()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get updatedAt => text().nullable()();
}
