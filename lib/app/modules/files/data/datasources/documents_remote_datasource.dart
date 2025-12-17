import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/core/services/supbase_storage_service.dart';

class DocumentsRemoteDatasource {
  final SupabaseClient supabaseClient;
  final SupbaseStorageService storageService;

  const DocumentsRemoteDatasource({
    required this.supabaseClient,
    required this.storageService,
  });

  Future<String?> uploadDocument({
    required File file,
    required String fileName,
    String? oldFileName,
  }) async {
    return await storageService.uploadDocument(
      file: file,
      fileName: fileName,
      oldFileName: oldFileName,
    );
  }

  Future<void> deleteDocument({required String fileName}) async {
    await storageService.deleteFile(bucket: 'documents', fileName: fileName);
  }
}
