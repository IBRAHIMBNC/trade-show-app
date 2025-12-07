import 'package:get/get.dart';

import 'files_listing_controller.dart';

class FilesListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilesListingController>(() => FilesListingController());
  }
}
