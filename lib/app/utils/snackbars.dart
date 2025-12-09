import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';

showErrorSnackbar({String title = 'Error', required String message}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: KColors.errorBg,
    colorText: KColors.errorFont,
    snackPosition: SnackPosition.BOTTOM,
  );
}

void showSuccessSnackbar({String title = 'Success', required String message}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: KColors.successBg,
    colorText: KColors.successFont,
    snackPosition: SnackPosition.BOTTOM,
  );
}
