import 'package:get/get.dart';

import 'note_details_controller.dart';

class NoteDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteDetailsController>(() => NoteDetailsController());
  }
}
