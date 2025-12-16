import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/colors.dart';

showErrorSnackbar({
  String title = 'Error',
  required String message,
  Duration duration = const Duration(seconds: 2),
}) {
  Get.closeAllSnackbars();
  Get.snackbar(
    title,
    message,
    backgroundColor: KColors.errorBg,
    colorText: KColors.errorFont,
    snackPosition: SnackPosition.TOP,
    duration: duration,
  );
}

void showSuccessSnackbar({
  String title = 'Success',
  required String message,
  Duration duration = const Duration(seconds: 2),
}) {
  Get.closeAllSnackbars();
  Get.snackbar(
    title,
    message,
    backgroundColor: KColors.successBg,
    colorText: KColors.successFont,
    snackPosition: SnackPosition.TOP,
    duration: duration,
  );
}
