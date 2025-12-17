import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/core/enums/file_type_enum.dart';
import 'package:supplier_snap/app/core/services/file_picker_service.dart';
import 'package:supplier_snap/app/modules/files/data/models/document_model.dart';
import 'package:supplier_snap/app/modules/files/data/repository/documents_repository.dart';
import 'package:supplier_snap/app/modules/files/presentation/widgets/add_file_sheet.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/supplier_detail/supplier_detail_controller.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/utils/bottom_sheets.dart';
import 'package:supplier_snap/app/utils/loading_overlay.dart';
import 'package:supplier_snap/app/utils/my_utils.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class FilesListingController extends GetxController {
  final DocumentsRepository documentsRepository;
  FilesListingController({required this.documentsRepository});

  final fileNameCont = TextEditingController();

  final RxList<DocumentModel> files = RxList<DocumentModel>();

  final supplierId = Get.find<SupplierDetailController>().supplier.id;

  final Rxn<File> selectedFile = Rxn<File>();

  final filePickerService = Get.find<FilePickerService>();

  showAddFileSheet({DocumentModel? document}) {
    if (document != null) {
      fileNameCont.text = document.title;
      selectedFile.value = File(document.absolutePath);
    } else {
      fileNameCont.clear();
      selectedFile.value = null;
    }
    Get.bottomSheet(
      AddEditFileSheet(document: document),
      isScrollControlled: true,
      isDismissible: false,
    );
  }

  addFile() async {
    if (selectedFile.value == null || fileNameCont.text.trim().isEmpty) {
      showErrorSnackbar(message: 'Please provide all required information.');
      return;
    }
    Get.back();
    isAppLoading = true;

    final relativePath = await filePickerService.saveFilePermanently(
      selectedFile.value!,
      prefix: 'document_',
      subdirectory: 'documents',
    );

    if (relativePath == null) {
      showErrorSnackbar(message: 'Failed to save the file. Please try again.');
      return;
    }

    final ext = filePickerService.getFileExtension(selectedFile.value!);
    final newDocument = DocumentModel(
      supplierId: supplierId!,
      localPath: relativePath,
      title: fileNameCont.text.trim(),
      type: DocumentType.fromExtension(ext),
    );

    final result = await documentsRepository.createDocument(newDocument);

    isAppLoading = false;

    fileNameCont.clear();
    selectedFile.value = null;
    result.fold(
      (l) => showErrorSnackbar(
        message: 'Failed to add document. Please try again.',
      ),
      (r) {
        showSuccessSnackbar(message: 'Document added successfully.');
      },
    );
  }

  onEditFile(DocumentModel? document) async {
    if (selectedFile.value == null || fileNameCont.text.trim().isEmpty) {
      showErrorSnackbar(message: 'Please provide all required information.');
      return;
    }

    Get.back();
    isAppLoading = true;
    if (selectedFile.value!.path != document!.absolutePath) {
      await MyUtils.deletePermanentFile(document.absolutePath);
    }
    final relativePath = await filePickerService.saveFilePermanently(
      selectedFile.value!,
      prefix: 'document_',
      subdirectory: 'documents',
    );

    if (relativePath == null) {
      isAppLoading = false;
      showErrorSnackbar(message: 'Failed to save the file. Please try again.');
      return;
    }

    final ext = filePickerService.getFileExtension(selectedFile.value!);
    final updatedDocument = document.copyWith(
      title: fileNameCont.text.trim(),
      localPath: relativePath,
      type: DocumentType.fromExtension(ext),
    );

    final result = await documentsRepository.updateDocument(
      document.id!,
      updatedDocument,
    );

    isAppLoading = false;
    fileNameCont.clear();
    selectedFile.value = null;

    result.fold(
      (l) => showErrorSnackbar(
        message: 'Failed to update document. Please try again.',
      ),
      (r) {
        showSuccessSnackbar(message: 'Document updated successfully.');
      },
    );
  }

  pickFile() async {
    final pickedFile = await filePickerService.showImagePickerOptions(
      allowedSources: FileSource.values,
    );
    if (pickedFile != null) {
      selectedFile.value = pickedFile;
    }
  }

  deleteFile(DocumentModel document) async {
    final sheetResult = await showConfirmationSheet(
      title: 'Delete Document',
      content: 'Are you sure you want to delete this document?',
      iconPath: KIcons.delete,
    );
    if (sheetResult != true) return;
    final result = await documentsRepository.deleteDocument(document.id!);
    result.fold(
      (l) => showErrorSnackbar(
        message: 'Failed to delete document. Please try again.',
      ),
      (r) async {
        await MyUtils.deletePermanentFile(document.absolutePath);
        showSuccessSnackbar(message: 'Document deleted successfully.');
      },
    );
  }

  onFileTap(DocumentModel document) {
    Get.toNamed(Routes.FILE_VIEWER, arguments: document);
  }

  @override
  void onInit() {
    files.bindStream(
      documentsRepository.watchDocumentsBySupplierId(supplierId!),
    );
    super.onInit();
  }

  @override
  void dispose() {
    fileNameCont.dispose();
    super.dispose();
  }
}
