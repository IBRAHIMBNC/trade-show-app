import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/modules/files/data/datasources/documents_local_datasource.dart';
import 'package:supplier_snap/app/modules/files/data/datasources/documents_remote_datasource.dart';
import 'package:supplier_snap/app/modules/files/data/repository/documents_repository.dart';

import 'files_listing_controller.dart';

class FilesListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentsLocalDatasource(database: Get.find()));

    Get.lazyPut(
      () => DocumentsRemoteDatasource(
        supabaseClient: Supabase.instance.client,
        storageService: Get.find(),
      ),
    );
    Get.lazyPut(
      () => DocumentsRepository(
        localDatasource: Get.find(),
        remoteDatasource: Get.find(),
        connectivityService: Get.find(),
      ),
    );

    Get.lazyPut<FilesListingController>(
      () => FilesListingController(documentsRepository: Get.find()),
    );
  }
}
