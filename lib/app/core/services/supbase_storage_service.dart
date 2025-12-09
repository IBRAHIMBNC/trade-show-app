import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupbaseStorageService extends GetxService {
  final SupabaseClient supabaseClient;

  SupbaseStorageService({required this.supabaseClient});

  static const String _publicUrl =
      'https://qbtemzrdshumbkbzpdak.supabase.co/storage/v1/object/public/';

  Future<String?> uploadFile({
    required File file,
    required String fileName,
  }) async {
    try {
      await deleteFile(fileName);
      final path = await supabaseClient.storage
          .from('avatars')
          .upload(fileName, file);

      return _publicUrl + path;
    } catch (e) {
      debugPrint('Error uploading file: $e');
      return null;
    }
  }

  /// Get public URL for a file path
  String getPublicUrl(String filePath) {
    return supabaseClient.storage.from('avatars').getPublicUrl(filePath);
  }

  /// Get public URL from just the filename (adds avatars/ prefix)
  String getAvatarUrl(String fileName) {
    return supabaseClient.storage.from('avatars').getPublicUrl(fileName);
  }

  Future<void> deleteFile(String fileName) async {
    try {
      await supabaseClient.storage.from('avatars').remove([fileName]);
      debugPrint('File deleted: $fileName');
    } catch (e) {
      debugPrint('Error deleting file: $e');
    }
  }
}
