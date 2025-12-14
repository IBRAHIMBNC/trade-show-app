import 'package:get/get.dart';

import '../controllers/file_viewer_controller.dart';

class FileViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FileViewerController>(
      () => FileViewerController(),
    );
  }
}
