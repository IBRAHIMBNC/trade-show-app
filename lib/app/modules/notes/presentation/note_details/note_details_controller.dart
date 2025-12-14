import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/notes/data/models/note_model.dart';
import 'package:supplier_snap/app/modules/notes/data/repository/notes_repository.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/supplier_detail/supplier_detail_controller.dart';
import 'package:supplier_snap/app/utils/bottom_sheets.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class NoteDetailsController extends GetxController {
  final NotesRepository notesRepository;
  NoteDetailsController({required this.notesRepository});
  final noteController = TextEditingController();

  final supplierId = Get.find<SupplierDetailController>()
      .supplierId; // Assuming supplierId is available globally

  late final NoteModel? note = Get.arguments as NoteModel?;

  late bool isEditMode = note != null;

  bool isDeleted = false;

  void saveNote() async {
    final content = noteController.text.trim();
    if (isDeleted) {
      await deleteNote();
      return;
    }

    if (note != null) {
      if (content.isNotEmpty) {
        await updateNote(content);
      }
    } else if (content.isNotEmpty) {
      await addNote(content);
    }
  }

  Future<void> addNote(String content) async {
    final title = content
        .split(' ')
        .take(10)
        .join(' ')
        .toString(); // First line or first 20 chars
    final newNote = NoteModel(
      title: title, // First line or first 20 chars
      supplierId: supplierId, // Placeholder, update as needed
      content: content,
      createdAt: DateTime.now(),
    );
    final result = await notesRepository.createNote(newNote);
    result.fold(
      (left) {
        showErrorSnackbar(message: 'Failed to save note. Please try again.');
      },
      (right) {
        showSuccessSnackbar(message: 'Note saved successfully.');
      },
    );
  }

  Future<void> updateNote(String content) async {
    final title = content
        .split(' ')
        .take(10)
        .join(' ')
        .toString(); // First line or first 20 chars
    final updatedNote = note!.copyWith(title: title, content: content);
    final result = await notesRepository.updateNote(note!.id!, updatedNote);
    result.fold(
      (left) {
        showErrorSnackbar(message: 'Failed to update note. Please try again.');
      },
      (right) {
        // showSuccessSnackbar(message: 'Note updated successfully.');
      },
    );
  }

  Future<void> deleteNote() async {
    final result = await notesRepository.deleteNote(note!.id!);
    result.fold(
      (left) {
        showErrorSnackbar(message: 'Failed to delete note. Please try again.');
      },
      (right) {
        showSuccessSnackbar(message: 'Note deleted successfully.');
        Get.back(); // Close the details view
      },
    );
  }

  void showDeleteNoteSheet() async {
    if (note != null) {
      final sheetResult = await showConfirmationSheet(
        title: 'Delete Note',
        content: 'Are you sure you want to delete this note?',
      );
      isDeleted = sheetResult ?? false;
      if (isDeleted) Get.back();
    }
  }

  @override
  void onInit() {
    noteController.text = note?.content ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    saveNote();
    noteController.dispose();
    super.onClose();
  }
}
