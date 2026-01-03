import 'package:drift/drift.dart';
import 'package:supplier_snap/app/core/database/app_db.dart';
import 'package:supplier_snap/app/modules/notes/data/models/note_model.dart';

class NotesLocalDatasource {
  final AppDatabase database;

  NotesLocalDatasource({required this.database});

  /// Insert a new note into local database
  Future<int> insertNote(NoteModel note) async {
    final now = DateTime.now();
    return await database
        .into(database.notesTable)
        .insert(
          NotesTableCompanion(
            title: Value(note.title),
            content: Value(note.content),
            createdAt: Value(note.createdAt ?? now),
            supplierId: Value(note.supplierId),
            updatedAt: Value(now),
            isSynced: const Value(false), // Mark as unsynced for cloud sync
          ),
        );
  }

  /// Get all notes from local database (excluding soft-deleted)
  Future<List<NotesTableData>> getAllNotes() async {
    return await (database.select(
      database.notesTable,
    )..where((tbl) => tbl.deletedAt.isNull())).get();
  }

  /// Get notes by supplier ID (excluding soft-deleted)
  Future<List<NotesTableData>> getNotesBySupplierId(int supplierId) async {
    return await (database.select(database.notesTable)
          ..where((tbl) => tbl.supplierId.equals(supplierId))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();
  }

  /// Watch notes by supplier ID (Stream for real-time updates, excluding soft-deleted)
  Stream<List<NotesTableData>> watchNotesBySupplierId(int supplierId) {
    return (database.select(database.notesTable)
          ..where((tbl) => tbl.supplierId.equals(supplierId))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .watch();
  }

  /// Get a single note by ID (excluding soft-deleted)
  Future<NotesTableData?> getNoteById(int id) async {
    return await (database.select(database.notesTable)
          ..where((tbl) => tbl.id.equals(id))
          ..where((tbl) => tbl.deletedAt.isNull()))
        .getSingleOrNull();
  }

  /// Update a note in local database
  Future<bool> updateNote(int id, NoteModel note) async {
    final now = DateTime.now();
    return await database
        .update(database.notesTable)
        .replace(
          NotesTableCompanion(
            id: Value(id),
            title: Value(note.title),
            content: Value(note.content),
            createdAt: Value(note.createdAt ?? DateTime.now()),
            supplierId: Value(note.supplierId),
            updatedAt: Value(now),
            isSynced: const Value(false), // Mark as unsynced for cloud sync
          ),
        );
  }

  /// Soft delete a note (mark as deleted instead of removing)
  Future<int> deleteNote(int id) async {
    final now = DateTime.now();
    return await (database.update(
      database.notesTable,
    )..where((tbl) => tbl.id.equals(id))).write(
      NotesTableCompanion(
        deletedAt: Value(now),
        updatedAt: Value(now),
        isSynced: const Value(false),
      ),
    );
  }

  /// Search notes by title or content (excluding soft-deleted)
  Future<List<NotesTableData>> searchNotes(String query) async {
    final lowerQuery = query.toLowerCase();
    return await (database.select(database.notesTable)
          ..where((tbl) => tbl.deletedAt.isNull())
          ..where(
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

  /// Soft delete all notes for a specific supplier
  Future<int> deleteNotesBySupplierId(int supplierId) async {
    final now = DateTime.now();
    return await (database.update(
      database.notesTable,
    )..where((tbl) => tbl.supplierId.equals(supplierId))).write(
      NotesTableCompanion(
        deletedAt: Value(now),
        updatedAt: Value(now),
        isSynced: const Value(false),
      ),
    );
  }
}
