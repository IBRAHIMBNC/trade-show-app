import 'package:drift/drift.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/modules/files/data/models/document_model.dart';
import 'package:supplier_snap/app/utils/my_utils.dart';

class DocumentsLocalDatasource {
  final AppDatabase database;

  DocumentsLocalDatasource({required this.database});

  /// Insert a new document into local database
  Future<int> insertDocument(DocumentModel document) async {
    return await database
        .into(database.documentTable)
        .insert(
          DocumentTableCompanion(
            title: Value(document.title),
            localPath: Value(document.localPath),
            url: Value(document.url),
            type: Value(document.type.name),
            createdAt: Value(document.createdAt ?? DateTime.now()),
            supplierId: Value(document.supplierId),
            isSynced: Value(document.isSynced),
          ),
        );
  }

  /// Get all documents from local database
  Future<List<DocumentTableData>> getAllDocuments() async {
    return await database.select(database.documentTable).get();
  }

  /// Get documents by supplier ID
  Future<List<DocumentTableData>> getDocumentsBySupplierId(
    int supplierId,
  ) async {
    return await (database.select(
      database.documentTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).get();
  }

  /// Watch documents by supplier ID (Stream for real-time updates)
  Stream<List<DocumentTableData>> watchDocumentsBySupplierId(int supplierId) {
    return (database.select(
      database.documentTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).watch();
  }

  /// Get a single document by ID
  Future<DocumentTableData?> getDocumentById(int id) async {
    return await (database.select(
      database.documentTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Update a document in local database
  Future<bool> updateDocument(int id, DocumentModel document) async {
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
            isSynced: Value(document.isSynced),
          ),
        );
  }

  /// Delete a document from local database
  Future<int> deleteDocument(int id) async {
    // Get the document to delete its file
    final document = await getDocumentById(id);
    if (document != null) {
      await MyUtils.deletePermanentFile(document.localPath);
    }

    return await (database.delete(
      database.documentTable,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  /// Search documents by title or type
  Future<List<DocumentTableData>> searchDocuments(String query) async {
    final lowerQuery = query.toLowerCase();
    return await (database.select(database.documentTable)..where(
          (tbl) =>
              tbl.title.lower().contains(lowerQuery) |
              tbl.type.lower().contains(lowerQuery),
        ))
        .get();
  }

  /// Get documents by type
  Future<List<DocumentTableData>> getDocumentsByType(String type) async {
    return await (database.select(
      database.documentTable,
    )..where((tbl) => tbl.type.equals(type))).get();
  }

  /// Clear all documents from local database
  Future<int> clearAllDocuments() async {
    return await database.delete(database.documentTable).go();
  }

  /// Delete all documents for a specific supplier
  Future<int> deleteDocumentsBySupplierId(int supplierId) async {
    // Get documents to delete their files
    final documents = await getDocumentsBySupplierId(supplierId);
    for (final doc in documents) {
      await MyUtils.deletePermanentFile(doc.localPath);
    }

    return await (database.delete(
      database.documentTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).go();
  }
}
