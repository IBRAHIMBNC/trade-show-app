import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';
import 'package:supplier_snap/app/modules/supplier/data/repository/supplier_repository.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/utils/bottom_sheets.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class HomeController extends GetxController {
  final SupplierRepository supplierRepository;

  HomeController({required this.supplierRepository});

  final RxList<SupplierModel> suppliers = <SupplierModel>[].obs;

  onDeleteSupplierTap(int supplierId) async {
    final confirmDeleteAction = await showConfirmationSheet(
      title: 'Delete Supplier',
      content: 'Do you want to delete this supplier?',
      iconPath: KIcons.delete,
    );
    if (confirmDeleteAction == true) {
      final result = await supplierRepository.deleteSupplier(supplierId);

      result.fold(
        (failure) {
          // Handle failure if needed
        },
        (data) {
          showSuccessSnackbar(message: 'Supplier deleted successfully.');
        },
      );
    }
  }

  // init() {
  //   for (var supplier in dummySuppliers) {
  //     supplierRepository.createSupplier(supplier);
  //   }
  // }

  @override
  void onInit() {
    // init();
    suppliers.bindStream(supplierRepository.watchMySuppliers);
    super.onInit();
  }

  void onEditSupplierTap(SupplierModel supplier) {
    Get.toNamed(Routes.ADD_SUPPLIER, arguments: supplier);
  }
}
