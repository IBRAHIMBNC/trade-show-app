import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:supplier_snap/app/widgets/alert_sheet.dart';
import 'package:supplier_snap/app/widgets/confirmation_sheet.dart';

Future<bool?> showConfirmationSheet({
  String title = 'Are you sure?',
  String? content,
  String? iconPath,
  String? positiveButtonText,
  String? negativeButtonText,
}) {
  return Get.bottomSheet<bool>(
    ConfirmationSheet(
      title: title,
      message: content,
      iconPath: iconPath,
      positiveButtonText: positiveButtonText,
      negativeButtonText: negativeButtonText,
    ),
    isScrollControlled: true,
  );
}

Future<void> showAlertSheet({
  String title = 'Are you sure?',
  String? content,
  String? iconPath,
}) {
  return Get.bottomSheet<void>(
    AlertSheet(title: title, message: content, iconPath: iconPath),
    isScrollControlled: true,
  );
}
