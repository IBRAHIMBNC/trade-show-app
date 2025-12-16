import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/utils/loading_overlay.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';
import 'package:supplier_snap/app/widgets/custom_image.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/my_list_tile.dart';

/// Service to handle file and image picking operations
class FilePickerService extends GetxService {
  final ImagePicker _imagePicker = ImagePicker();

  late String appSupportDirectoryPath;

  Future<FilePickerService> init() async {
    final Directory appSupportDir = await getApplicationSupportDirectory();
    appSupportDirectoryPath = appSupportDir.path;

    return this;
  }

  /// Pick a single image from gallery
  Future<File?> pickImageFromGallery({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: imageQuality ?? 85,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      debugPrint('Error picking image from gallery: $e');
      Get.snackbar('Error', 'Failed to pick image from gallery');
      return null;
    }
  }

  /// Pick a single image from camera
  Future<File?> pickImageFromCamera({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: imageQuality ?? 85,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      debugPrint('Error picking image from camera: $e');
      Get.snackbar('Error', 'Failed to capture image from camera');
      return null;
    }
  }

  /// Pick multiple images from gallery
  Future<List<File>?> pickMultipleImages({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) async {
    try {
      final List<XFile> pickedFiles = await _imagePicker.pickMultiImage(
        imageQuality: imageQuality ?? 85,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

      if (pickedFiles.isNotEmpty) {
        return pickedFiles.map((xFile) => File(xFile.path)).toList();
      }
      return null;
    } catch (e) {
      debugPrint('Error picking multiple images: $e');
      Get.snackbar('Error', 'Failed to pick images');
      return null;
    }
  }

  /// Pick a single file (PDF, DOC, etc.)
  Future<File?> pickFile({
    List<String>? allowedExtensions,
    FileType type = FileType.any,
  }) async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: type,
        allowedExtensions: allowedExtensions,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
      return null;
    } catch (e) {
      debugPrint('Error picking file: $e');
      showErrorSnackbar(message: 'Failed to pick file');
      return null;
    }
  }

  /// Pick multiple files (PDF, DOC, etc.)
  Future<List<File>?> pickMultipleFiles({
    List<String>? allowedExtensions,
    FileType type = FileType.any,
  }) async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: type,
        allowedExtensions: allowedExtensions,
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files
            .where((file) => file.path != null)
            .map((file) => File(file.path!))
            .toList();
      }
      return null;
    } catch (e) {
      debugPrint('Error picking multiple files: $e');
      showErrorSnackbar(message: 'Failed to pick files');
      return null;
    }
  }

  /// Get file extension
  String getFileExtension(File file) {
    return path.extension(file.path).toLowerCase();
  }

  /// Get file name without extension
  String getFileNameWithoutExtension(File file) {
    return path.basenameWithoutExtension(file.path);
  }

  /// Get file name with extension
  String getFileName(File file) {
    return path.basename(file.path);
  }

  /// Pick a video from gallery
  Future<File?> pickVideoFromGallery({Duration? maxDuration}) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickVideo(
        source: ImageSource.gallery,
        maxDuration: maxDuration,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      debugPrint('Error picking video from gallery: $e');
      Get.snackbar('Error', 'Failed to pick video from gallery');
      return null;
    }
  }

  /// Pick a video from camera
  Future<File?> pickVideoFromCamera({Duration? maxDuration}) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickVideo(
        source: ImageSource.camera,
        maxDuration: maxDuration,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      debugPrint('Error recording video from camera: $e');
      Get.snackbar('Error', 'Failed to record video from camera');
      return null;
    }
  }

  /// Show a bottom sheet to choose between camera and gallery
  Future<File?> showImagePickerOptions({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
    List<FileSource> allowedSources = const [
      FileSource.gallery,
      FileSource.camera,
    ],
  }) async {
    return Get.bottomSheet<File?>(
      Container(
        padding: EdgeInsets.only(
          bottom: 32.h,
          top: 20.h,
          left: 20.w,
          right: 20.w,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          spacing: 20.h,
          mainAxisSize: MainAxisSize.min,
          children: [
            MyContainer(height: 5.h, width: 40.w, color: KColors.black40),
            if (allowedSources.contains(FileSource.files))
              MyListTile(
                radius: 12.r,
                border: BorderSide(color: KColors.black10),
                padding: kPadding16.all,
                leading: CustomImage.icon(
                  KIcons.emptyFiles,
                  size: 22.sp,
                  color: KColors.black,
                ),
                title: CustomText.label14b400('Files'),
                onTap: () async {
                  isAppLoading = true;
                  final file = await pickFile(
                    allowedExtensions: ['pdf'],
                    type: FileType.custom,
                  );
                  isAppLoading = false;
                  Get.back(result: file);
                },
              ),
            if (allowedSources.contains(FileSource.camera))
              MyListTile(
                radius: 12.r,
                border: BorderSide(color: KColors.black10),
                padding: kPadding16.all,
                leading: CustomImage.icon(
                  KIcons.camera,
                  size: 22.sp,
                  color: KColors.black,
                ),
                title: CustomText.label14b400('Camera'),
                onTap: () async {
                  isAppLoading = true;
                  final file = await pickImageFromCamera(
                    imageQuality: imageQuality,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                  );
                  isAppLoading = false;
                  Get.back(result: file);
                },
              ),
            if (allowedSources.contains(FileSource.gallery))
              MyListTile(
                radius: 12.r,
                border: BorderSide(color: KColors.black10),
                padding: kPadding16.all,
                leading: Icon(CupertinoIcons.photo, color: Colors.black),
                title: CustomText.label14b400('Gallery'),
                onTap: () async {
                  isAppLoading = true;
                  final file = await pickImageFromGallery(
                    imageQuality: imageQuality,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                  );
                  isAppLoading = false;
                  Get.back(result: file);
                },
              ),
            MyListTile(
              radius: 12.r,
              border: BorderSide(color: KColors.black10),
              padding: kPadding16.all,
              leading: const Icon(Icons.close, color: Colors.black),
              title: const Text('Cancel'),
              onTap: () => Get.back(),
            ),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
    );
  }

  /// Get file size in MB
  double getFileSizeInMB(File file) {
    final bytes = file.lengthSync();
    return bytes / (1024 * 1024);
  }

  /// Check if file size is within limit (in MB)
  bool isFileSizeValid(File file, double maxSizeInMB) {
    final fileSizeInMB = getFileSizeInMB(file);
    return fileSizeInMB <= maxSizeInMB;
  }

  /// Save file to permanent storage
  /// This copies the file from temp directory to app's support directory
  /// [subdirectory] - Optional subdirectory name (e.g., 'suppliers', 'products')
  /// [prefix] - Optional filename prefix (e.g., 'supplier', 'product')
  Future<String?> saveFilePermanently(
    File file, {
    String? customName,
    String subdirectory = 'media',
    String prefix = 'file',
  }) async {
    try {
      // Create the specified subdirectory
      final Directory targetDir = Directory(
        '$appSupportDirectoryPath/$subdirectory',
      );
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }

      // Generate a unique filename with better uniqueness
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String randomSuffix = DateTime.now().microsecond.toString();
      final String extension = path.extension(file.path);

      // Ensure fileName always has an extension
      String fileName;
      if (customName != null) {
        // If customName already has an extension, use it; otherwise append the original extension
        fileName = path.extension(customName).isEmpty
            ? '$customName$extension'
            : customName;
      } else {
        fileName = '${prefix}_${timestamp}_$randomSuffix$extension';
      }

      // Copy the file to permanent storage
      final String permanentPath = '${targetDir.path}/$fileName';
      final File permanentFile = await file.copy(permanentPath);

      final relativePath = path.relative(
        permanentFile.path,
        from: appSupportDirectoryPath,
      );

      return relativePath;
    } catch (e) {
      debugPrint('Error saving file permanently: $e');
      showErrorSnackbar(message: 'Failed to save file');
      return null;
    }
  }
}

enum FileSource { gallery, camera, files }
