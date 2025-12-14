import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/files/presentation/widgets/add_file_sheet.dart';

class FilesListingController extends GetxController {
  addFile() {
    Get.bottomSheet(
      AddEditFileSheet(),
      isScrollControlled: true,
      isDismissible: false,
    );
  }
}
