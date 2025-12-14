import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/notes/data/datasources/notes_local_datasource.dart';
import 'package:supplier_snap/app/modules/notes/data/repository/notes_repository.dart';

import 'notes_listing_controller.dart';

class NotesListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesLocalDatasource>(
      () => NotesLocalDatasource(database: Get.find()),
    );
    Get.lazyPut(() => NotesRepository(localDatasource: Get.find()));

    Get.lazyPut<NotesListingController>(
      () => NotesListingController(notesRepository: Get.find()),
    );
  }
}
