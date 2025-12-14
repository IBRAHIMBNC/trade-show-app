import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/notes/data/datasources/notes_local_datasource.dart';
import 'package:supplier_snap/app/modules/notes/data/repository/notes_repository.dart';

import 'note_details_controller.dart';

class NoteDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesLocalDatasource>(
      () => NotesLocalDatasource(database: Get.find()),
    );
    Get.lazyPut(() => NotesRepository(localDatasource: Get.find()));

    Get.lazyPut<NoteDetailsController>(
      () => NoteDetailsController(notesRepository: Get.find()),
    );
  }
}
