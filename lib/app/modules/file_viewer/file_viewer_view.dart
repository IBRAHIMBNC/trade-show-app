import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/core/enums/file_type_enum.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_appbar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'file_viewer_controller.dart';

class FileViewerView extends GetView<FileViewerController> {
  const FileViewerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: controller.args?.title ?? 'File Viewer',
        onBackPressed: () => Get.back(),
      ),
      body: _buildFileViewer(),
    );
  }

  Widget _buildFileViewer() {
    final document = controller.args!;
    final file = File(document.absolutePath);

    if (!file.existsSync()) {
      if (document.url != null && document.url!.isNotEmpty) {
        // Handle remote file loading if necessary
        return SfPdfViewer.network(
          document.url!,
          enableDoubleTapZooming: true,
          enableTextSelection: true,
          canShowScrollHead: true,
          canShowScrollStatus: true,
          onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
            showErrorSnackbar(message: 'Failed to load PDF: ${details.error}');
          },
        );
      }
    }

    switch (document.type) {
      case DocumentType.pdf:
        return SfPdfViewer.file(
          file,
          enableDoubleTapZooming: true,
          enableTextSelection: true,
          canShowScrollHead: true,
          canShowScrollStatus: true,
          onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
            showErrorSnackbar(message: 'Failed to load PDF: ${details.error}');
          },
        );

      case DocumentType.image:
        if (file.existsSync()) {
          return InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: Center(
              child: Image.file(
                file,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('Failed to load image'),
                    ],
                  );
                },
              ),
            ),
          );
        } else {
          return _buildUnsupportedFileView();
        }

      default:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.insert_drive_file, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              CustomText.label14b600('Unsupported file type'),
              SizedBox(height: 8),
              CustomText.label12b400(
                'Cannot preview this type of file',
                color: KColors.black60,
              ),
            ],
          ),
        );
    }
  }

  _buildUnsupportedFileView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red),
          SizedBox(height: 16),
          CustomText.label14b600('File not found'),
          SizedBox(height: 8),
          CustomText.label12b400(
            'The file may have been deleted or moved',
            color: KColors.black60,
          ),
        ],
      ),
    );
  }
}
