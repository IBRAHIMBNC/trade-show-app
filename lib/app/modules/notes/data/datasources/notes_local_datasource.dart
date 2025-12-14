import 'package:drift/drift.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/modules/notes/data/models/note_model.dart';

class NotesLocalDatasource {
  final AppDatabase database;

  NotesLocalDatasource({required this.database});

  /// Insert a new note into local database
  Future<int> insertNote(NoteModel note) async {
    return await database
        .into(database.notesTable)
        .insert(
          NotesTableCompanion(
            title: Value(note.title),
            content: Value(note.content),
            createdAt: Value(note.createdAt ?? DateTime.now()),
            supplierId: Value(note.supplierId),
          ),
        );
  }

  /// Get all notes from local database
  Future<List<NotesTableData>> getAllNotes() async {
    return await database.select(database.notesTable).get();
  }

  /// Get notes by supplier ID
  Future<List<NotesTableData>> getNotesBySupplierId(int supplierId) async {
    return await (database.select(
      database.notesTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).get();
  }

  /// Watch notes by supplier ID (Stream for real-time updates)
  Stream<List<NotesTableData>> watchNotesBySupplierId(int supplierId) {
    return (database.select(
      database.notesTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).watch();
  }

  /// Get a single note by ID
  Future<NotesTableData?> getNoteById(int id) async {
    return await (database.select(
      database.notesTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Update a note in local database
  Future<bool> updateNote(int id, NoteModel note) async {
    return await database
        .update(database.notesTable)
        .replace(
          NotesTableCompanion(
            id: Value(id),
            title: Value(note.title),
            content: Value(note.content),
            createdAt: Value(note.createdAt ?? DateTime.now()),
            supplierId: Value(note.supplierId),
          ),
        );
  }

  /// Delete a note from local database
  Future<int> deleteNote(int id) async {
    return await (database.delete(
      database.notesTable,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  /// Search notes by title or content
  Future<List<NotesTableData>> searchNotes(String query) async {
    final lowerQuery = query.toLowerCase();
    return await (database.select(database.notesTable)..where(
          (tbl) =>
              tbl.title.lower().contains(lowerQuery) |
              tbl.content.lower().contains(lowerQuery),
        ))
        .get();
  }

  /// Clear all notes from local database
  Future<int> clearAllNotes() async {
    return await database.delete(database.notesTable).go();
  }

  /// Delete all notes for a specific supplier
  Future<int> deleteNotesBySupplierId(int supplierId) async {
    return await (database.delete(
      database.notesTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).go();
  }
}
