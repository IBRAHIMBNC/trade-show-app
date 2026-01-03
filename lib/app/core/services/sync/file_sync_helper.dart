import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Helper class for syncing files between local storage and Supabase Storage
class FileSyncHelper {
  final SupabaseClient _supabaseClient;
  late String _appSupportDirectoryPath;

  FileSyncHelper({SupabaseClient? supabaseClient})
    : _supabaseClient = supabaseClient ?? Supabase.instance.client {
    _initAppDirectory();
  }

  Future<void> _initAppDirectory() async {
    final Directory appSupportDir = await getApplicationSupportDirectory();
    _appSupportDirectoryPath = appSupportDir.path;
  }

  /// Upload a file to Supabase Storage
  /// Returns the public URL of the uploaded file, or null if upload fails
  Future<String?> uploadFile({
    required String localPath,
    required String bucket,
    String? customFileName,
  }) async {
    try {
      final file = File(localPath);
      if (!await file.exists()) {
        debugPrint('FileSyncHelper: File does not exist: $localPath');
        return null;
      }

      // Generate unique filename if not provided
      final fileName =
          customFileName ??
          '${DateTime.now().millisecondsSinceEpoch}_${path.basename(localPath)}';

      // Upload to Supabase Storage
      await _supabaseClient.storage
          .from(bucket)
          .upload(fileName, file, fileOptions: const FileOptions(upsert: true));

      // Get public URL
      final publicUrl = _supabaseClient.storage
          .from(bucket)
          .getPublicUrl(fileName);

      debugPrint('FileSyncHelper: Uploaded $localPath to $publicUrl');
      return publicUrl;
    } catch (e) {
      debugPrint('FileSyncHelper: Error uploading file: $e');
      return null;
    }
  }

  /// Upload multiple files to Supabase Storage
  /// Returns a list of public URLs (null for failed uploads)
  Future<List<String?>> uploadFiles({
    required List<String> localPaths,
    required String bucket,
  }) async {
    final results = <String?>[];
    for (final localPath in localPaths) {
      final url = await uploadFile(localPath: localPath, bucket: bucket);
      results.add(url);
    }
    return results;
  }

  /// Download a file from a remote URL to local storage
  /// Returns the relative file path (from app support directory), or null if download fails
  Future<String?> downloadFile({
    required String remoteUrl,
    String? subDirectory,
  }) async {
    try {
      // Ensure directory is initialized
      if (_appSupportDirectoryPath.isEmpty) {
        await _initAppDirectory();
      }

      // Create subdirectory (same pattern as saveFilePermanently)
      final Directory targetDir = Directory(
        '$_appSupportDirectoryPath/${subDirectory ?? 'sync_files'}',
      );
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }

      // Extract filename from URL
      final uri = Uri.parse(remoteUrl);
      final fileName = path.basename(uri.path);
      final absolutePath = '${targetDir.path}/$fileName';

      // Check if file already exists
      final localFile = File(absolutePath);
      if (await localFile.exists()) {
        // Return relative path (same as saveFilePermanently)
        final relativePath = path.relative(
          absolutePath,
          from: _appSupportDirectoryPath,
        );
        debugPrint('FileSyncHelper: File already exists: $relativePath');
        return relativePath;
      }

      // Download file
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        await localFile.writeAsBytes(response.bodyBytes);

        // Return relative path (same as saveFilePermanently)
        final relativePath = path.relative(
          absolutePath,
          from: _appSupportDirectoryPath,
        );
        debugPrint('FileSyncHelper: Downloaded to: $relativePath');
        return relativePath;
      } else {
        debugPrint(
          'FileSyncHelper: Failed to download, status: ${response.statusCode}',
        );
        return null;
      }
    } catch (e) {
      debugPrint('FileSyncHelper: Error downloading file: $e');
      return null;
    }
  }

  /// Download multiple files from remote URLs
  /// Returns a list of local file paths (null for failed downloads)
  Future<List<String?>> downloadFiles({
    required List<String> remoteUrls,
    String? subDirectory,
  }) async {
    final results = <String?>[];
    for (final url in remoteUrls) {
      final localPath = await downloadFile(
        remoteUrl: url,
        subDirectory: subDirectory,
      );
      results.add(localPath);
    }
    return results;
  }

  /// Delete a file from Supabase Storage
  Future<bool> deleteRemoteFile({
    required String bucket,
    required String fileName,
  }) async {
    try {
      await _supabaseClient.storage.from(bucket).remove([fileName]);
      debugPrint('FileSyncHelper: Deleted remote file: $bucket/$fileName');
      return true;
    } catch (e) {
      debugPrint('FileSyncHelper: Error deleting remote file: $e');
      return false;
    }
  }

  /// Extract filename from a Supabase Storage public URL
  String? extractFileNameFromUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return path.basename(uri.path);
    } catch (e) {
      return null;
    }
  }

  /// Check if a local file exists
  Future<bool> localFileExists(String localPath) async {
    final file = File(localPath);
    return await file.exists();
  }

  /// Get file size in bytes
  Future<int?> getFileSize(String localPath) async {
    try {
      final file = File(localPath);
      if (await file.exists()) {
        return await file.length();
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
