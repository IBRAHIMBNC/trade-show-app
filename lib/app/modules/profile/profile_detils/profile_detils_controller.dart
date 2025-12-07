import 'package:get/get.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';

class ProfileDetilsController extends GetxController {
  goToEditPofile() {
    Get.toNamed(Routes.EDIT_PROFILE);
  }

  goToChangePassword() {
    Get.toNamed(Routes.CHANGE_PASSWORD);
  }

  goToDeleteAccount() {
    Get.toNamed(Routes.DELETE_ACCOUNT);
  }
}
