import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/core/failures/failures.dart';
import 'package:supplier_snap/app/modules/auth/data/repository/auth_repository.dart';
import 'package:supplier_snap/app/modules/files/data/datasources/documents_local_datasource.dart';
import 'package:supplier_snap/app/modules/files/data/datasources/documents_remote_datasource.dart';
import 'package:supplier_snap/app/modules/files/data/models/document_model.dart';

class DocumentsRepository extends BaseRepository {
  final DocumentsLocalDatasource localDatasource;
  final DocumentsRemoteDatasource remoteDatasource;

  DocumentsRepository({
    required this.localDatasource,
    required this.remoteDatasource,
    required super.connectivityService,
  });

  /// Create a new document
  Future<Either<Failure, DocumentModel>> createDocument(
    DocumentModel document,
  ) async {
    try {
      final id = await localDatasource.insertDocument(document);
      DocumentTableData? createdDocument = await localDatasource
          .getDocumentById(id);

      if (connectivityService.isOnline.value) {
        final file = File(document.absolutePath);
        final String? imageUrl = await remoteDatasource.uploadDocument(
          file: file,
          fileName: file.path.split('/').last,
        );
        createdDocument = createdDocument?.copyWith(url: Value(imageUrl));
      }

      if (createdDocument != null) {
        return Right(DocumentModel.fromDatabaseModel(createdDocument));
      }

      return Left(DatabaseFailure('Failed to create document'));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Get all documents
  Future<Either<Failure, List<DocumentModel>>> getAllDocuments() async {
    try {
      final documents = await localDatasource.getAllDocuments();
      return Right(
        documents.map((d) => DocumentModel.fromDatabaseModel(d)).toList(),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Get documents by supplier ID
  Future<Either<Failure, List<DocumentModel>>> getDocumentsBySupplierId(
    int supplierId,
  ) async {
    try {
      final documents = await localDatasource.getDocumentsBySupplierId(
        supplierId,
      );
      return Right(
        documents.map((d) => DocumentModel.fromDatabaseModel(d)).toList(),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Watch documents by supplier ID (Stream)
  Stream<List<DocumentModel>> watchDocumentsBySupplierId(int supplierId) {
    return localDatasource
        .watchDocumentsBySupplierId(supplierId)
        .map(
          (documents) =>
              documents.map((d) => DocumentModel.fromDatabaseModel(d)).toList(),
        );
  }

  /// Get a single document by ID
  Future<Either<Failure, DocumentModel>> getDocumentById(int id) async {
    try {
      final document = await localDatasource.getDocumentById(id);
      if (document != null) {
        return Right(DocumentModel.fromDatabaseModel(document));
      }
      return Left(NotFoundFailure('Document not found'));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Update a document
  Future<Either<Failure, DocumentModel>> updateDocument(
    int id,
    DocumentModel document,
  ) async {
    try {
      final success = await localDatasource.updateDocument(id, document);
      if (success) {
        final updatedDocument = await localDatasource.getDocumentById(id);
        if (updatedDocument != null) {
          return Right(DocumentModel.fromDatabaseModel(updatedDocument));
        }
      }
      return Left(DatabaseFailure('Failed to update document'));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Delete a document
  Future<Either<Failure, bool>> deleteDocument(int id) async {
    try {
      final result = await localDatasource.deleteDocument(id);
      return Right(result > 0);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Search documents
  Future<Either<Failure, List<DocumentModel>>> searchDocuments(
    String query,
  ) async {
    try {
      final documents = await localDatasource.searchDocuments(query);
      return Right(
        documents.map((d) => DocumentModel.fromDatabaseModel(d)).toList(),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Get documents by type
  Future<Either<Failure, List<DocumentModel>>> getDocumentsByType(
    String type,
  ) async {
    try {
      final documents = await localDatasource.getDocumentsByType(type);
      return Right(
        documents.map((d) => DocumentModel.fromDatabaseModel(d)).toList(),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Delete all documents for a supplier
  Future<Either<Failure, bool>> deleteDocumentsBySupplierId(
    int supplierId,
  ) async {
    try {
      final result = await localDatasource.deleteDocumentsBySupplierId(
        supplierId,
      );
      return Right(result > 0);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Upload document to storage
  Future<String?> uploadDocument({
    required File file,
    required String fileName,
    String? oldFileName,
  }) async {
    return await remoteDatasource.uploadDocument(
      file: file,
      fileName: fileName,
      oldFileName: oldFileName,
    );
  }

  /// Delete document from storage
  Future<void> deleteDocumentFromStorage(String fileName) async {
    await remoteDatasource.deleteDocument(fileName: fileName);
  }
}
