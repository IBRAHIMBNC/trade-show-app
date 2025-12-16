import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/file_viewer/file_viewer_controller.dart';

class FileViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FileViewerController>(() => FileViewerController());
  }
}
