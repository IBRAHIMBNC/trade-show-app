import 'package:get/get.dart';

import 'notes_listing_controller.dart';

class NotesListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesListingController>(() => NotesListingController());
  }
}
