import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/files/data/models/document_model.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class FileViewerController extends GetxController {
  DocumentModel? args;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is DocumentModel) {
      args = Get.arguments as DocumentModel;
    } else {
      Get.back();
      showErrorSnackbar(message: 'File details are missing.');
    }
    super.onInit();
  }
}
