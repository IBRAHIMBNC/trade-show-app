import 'package:drift/drift.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/modules/files/data/models/document_model.dart';

class DocumentsLocalDatasource {
  final AppDatabase database;

  DocumentsLocalDatasource({required this.database});

  /// Insert a new document into local database
  Future<int> insertDocument(DocumentModel document) async {
    final now = DateTime.now();
    return await database
        .into(database.documentTable)
        .insert(
          DocumentTableCompanion(
            title: Value(document.title),
            localPath: Value(document.localPath),
            url: Value(document.url),
            type: Value(document.type.name),
            createdAt: Value(document.createdAt ?? now),
            supplierId: Value(document.supplierId),
            updatedAt: Value(now),
            isSynced: const Value(false), // Mark as unsynced for cloud sync
          ),
        );
  }

  /// Get all documents from local database (excluding soft-deleted)
  Future<List<DocumentTableData>> getAllDocuments() async {
    return await (database.select(
      database.documentTable,
    )..where((tbl) => tbl.deletedAt.isNull())).get();
  }

  /// Get documents by supplier ID (excluding soft-deleted)
  Future<List<DocumentTableData>> getDocumentsBySupplierId(
    int supplierId,
  ) async {
    return await (database.select(database.documentTable)
          ..where((tbl) => tbl.supplierId.equals(supplierId))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();
  }

  /// Watch documents by supplier ID (Stream for real-time updates, excluding soft-deleted)
  Stream<List<DocumentTableData>> watchDocumentsBySupplierId(int supplierId) {
    return (database.select(database.documentTable)
          ..where((tbl) => tbl.supplierId.equals(supplierId))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .watch();
  }

  /// Get a single document by ID (excluding soft-deleted)
  Future<DocumentTableData?> getDocumentById(int id) async {
    return await (database.select(database.documentTable)
          ..where((tbl) => tbl.id.equals(id))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .getSingleOrNull();
  }

  /// Update a document in local database
  Future<bool> updateDocument(int id, DocumentModel document) async {
    final now = DateTime.now();
    return await database
        .update(database.documentTable)
        .replace(
          DocumentTableCompanion(
            id: Value(id),
            title: Value(document.title),
            localPath: Value(document.localPath),
            url: Value(document.url),
            type: Value(document.type.name),
            createdAt: Value(document.createdAt ?? DateTime.now()),
            supplierId: Value(document.supplierId),
            updatedAt: Value(now),
            isSynced: const Value(false), // Mark as unsynced for cloud sync
          ),
        );
  }

  /// Soft delete a document (mark as deleted instead of removing)
  Future<int> deleteDocument(int id) async {
    final now = DateTime.now();
    return await (database.update(
      database.documentTable,
    )..where((tbl) => tbl.id.equals(id))).write(
      DocumentTableCompanion(
        deletedAt: Value(now),
        updatedAt: Value(now),
        isSynced: const Value(false),
      ),
    );
  }

  /// Search documents by title or type (excluding soft-deleted)
  Future<List<DocumentTableData>> searchDocuments(String query) async {
    final lowerQuery = query.toLowerCase();
    return await (database.select(database.documentTable)
          ..where((tbl) => tbl.deletedAt.isNull())
          ..where(
            (tbl) =>
                tbl.title.lower().contains(lowerQuery) |
                tbl.type.lower().contains(lowerQuery),
          ))
        .get();
  }

  /// Get documents by type (excluding soft-deleted)
  Future<List<DocumentTableData>> getDocumentsByType(String type) async {
    return await (database.select(database.documentTable)
          ..where((tbl) => tbl.type.equals(type))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();
  }

  /// Clear all documents from local database
  Future<int> clearAllDocuments() async {
    return await database.delete(database.documentTable).go();
  }

  /// Soft delete all documents for a specific supplier
  Future<int> deleteDocumentsBySupplierId(int supplierId) async {
    final now = DateTime.now();
    return await (database.update(
      database.documentTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).write(
      DocumentTableCompanion(
        deletedAt: Value(now),
        updatedAt: Value(now),
        isSynced: const Value(false),
      ),
    );
  }
}
