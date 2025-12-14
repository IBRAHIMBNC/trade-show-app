import 'package:get/get.dart';
import 'package:supplier_snap/app/core/services/file_picker_service.dart';

extension AbsolutePath on String {
  String get toAbsolutePath {
    final filePickerService = Get.find<FilePickerService>();
    return '${filePickerService.appSupportDirectoryPath}/$this';
  }

  String get toRelativePath {
    final filePickerService = Get.find<FilePickerService>();
    final appSupportPath = filePickerService.appSupportDirectoryPath;
    if (startsWith(appSupportPath)) {
      return substring(appSupportPath.length + 1);
    }
    return this;
  }
}
