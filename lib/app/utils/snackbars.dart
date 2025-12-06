import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';

showErrorSnackbar(String message) {
  Get.snackbar(
    'Error',
    message,
    backgroundColor: KColors.errorBg,
    colorText: KColors.errorFont,
    snackPosition: SnackPosition.BOTTOM,
  );
}

void showSuccessSnackbar(String message) {
  Get.snackbar(
    'Success',
    message,
    backgroundColor: KColors.successBg,
    colorText: KColors.successFont,
    snackPosition: SnackPosition.BOTTOM,
  );
}
