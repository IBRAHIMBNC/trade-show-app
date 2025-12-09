import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

/// Service to handle file and image picking operations
class FilePickerService extends GetxService {
  final ImagePicker _imagePicker = ImagePicker();

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
  }) async {
    return Get.bottomSheet<File?>(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.blue),
              title: const Text('Camera'),
              onTap: () async {
                final file = await pickImageFromCamera(
                  imageQuality: imageQuality,
                  maxWidth: maxWidth,
                  maxHeight: maxHeight,
                );
                Get.back(result: file);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.blue),
              title: const Text('Gallery'),
              onTap: () async {
                final file = await pickImageFromGallery(
                  imageQuality: imageQuality,
                  maxWidth: maxWidth,
                  maxHeight: maxHeight,
                );
                Get.back(result: file);
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel, color: Colors.grey),
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
}
