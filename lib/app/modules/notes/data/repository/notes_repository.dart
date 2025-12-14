import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:supplier_snap/app/core/failures/failures.dart';
import 'package:supplier_snap/app/modules/notes/data/datasources/notes_local_datasource.dart';
import 'package:supplier_snap/app/modules/notes/data/models/note_model.dart';

class NotesRepository {
  final NotesLocalDatasource localDatasource;

  NotesRepository({required this.localDatasource});

  /// Create a new note
  Future<Either<Failure, NoteModel>> createNote(NoteModel note) async {
    try {
      final id = await localDatasource.insertNote(note);
      final createdNote = await localDatasource.getNoteById(id);
      if (createdNote != null) {
        return Right(NoteModel.fromDatabaseModel(createdNote));
      }
      return Left(DatabaseFailure('Failed to create note'));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Get all notes
  Future<Either<Failure, List<NoteModel>>> getAllNotes() async {
    try {
      final notes = await localDatasource.getAllNotes();
      return Right(notes.map((n) => NoteModel.fromDatabaseModel(n)).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Get notes by supplier ID
  Future<Either<Failure, List<NoteModel>>> getNotesBySupplierId(
    int supplierId,
  ) async {
    try {
      final notes = await localDatasource.getNotesBySupplierId(supplierId);
      return Right(notes.map((n) => NoteModel.fromDatabaseModel(n)).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Watch notes by supplier ID (Stream)
  Stream<List<NoteModel>> watchNotesBySupplierId(int supplierId) {
    return localDatasource
        .watchNotesBySupplierId(supplierId)
        .map(
          (notes) => notes.map((n) => NoteModel.fromDatabaseModel(n)).toList(),
        );
  }

  /// Get a single note by ID
  Future<Either<Failure, NoteModel>> getNoteById(int id) async {
    try {
      final note = await localDatasource.getNoteById(id);
      if (note != null) {
        return Right(NoteModel.fromDatabaseModel(note));
      }
      return Left(NotFoundFailure('Note not found'));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Update a note
  Future<Either<Failure, NoteModel>> updateNote(int id, NoteModel note) async {
    try {
      final success = await localDatasource.updateNote(id, note);
      if (success) {
        final updatedNote = await localDatasource.getNoteById(id);
        if (updatedNote != null) {
          return Right(NoteModel.fromDatabaseModel(updatedNote));
        }
      }
      return Left(DatabaseFailure('Failed to update note'));
    } catch (e) {
      log(e.toString());
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Delete a note
  Future<Either<Failure, bool>> deleteNote(int id) async {
    try {
      final result = await localDatasource.deleteNote(id);
      return Right(result > 0);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Search notes
  Future<Either<Failure, List<NoteModel>>> searchNotes(String query) async {
    try {
      final notes = await localDatasource.searchNotes(query);
      return Right(notes.map((n) => NoteModel.fromDatabaseModel(n)).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  /// Delete all notes for a supplier
  Future<Either<Failure, bool>> deleteNotesBySupplierId(int supplierId) async {
    try {
      final result = await localDatasource.deleteNotesBySupplierId(supplierId);
      return Right(result > 0);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
