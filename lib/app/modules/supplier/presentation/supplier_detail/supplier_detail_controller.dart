import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/products/presentation/add_product/add_product_controller.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';
import 'package:supplier_snap/app/modules/supplier/data/repository/supplier_repository.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/supplier_detail/widgets/info_tab.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/supplier_detail/widgets/remarks_tab.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/supplier_detail/widgets/scoring_tab.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/utils/bottom_sheets.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class SupplierDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final SupplierRepository supplierRepository;
  SupplierDetailController({required this.supplierRepository});

  late final tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: 1,
  );
  final RxInt tabIndex = 1.obs;

  List<Widget> get tabViews => [ScoringTab(), InfoTab(), RemarksTab()];

  late int supplierId = Get.arguments as int;

  late SupplierModel supplier;

  final RxBool isLoading = false.obs;

  gotoProductListing() {
    Get.toNamed(Routes.PRODUCT_LISTING);
  }

  gotoFiles() {
    Get.toNamed(Routes.FILES_LISTING);
  }

  gotoNotes() {
    Get.toNamed(Routes.NOTES_LISTING);
  }

  goToAddProduct() {
    Get.toNamed(
      Routes.ADD_PRODUCT,
      arguments: AddProductViewArgs(supplier: supplier),
    );
  }

  gotoAddFile() {
    // Get.toNamed(Routes.ADD_FILE);
  }
  gotoAddNote() {
    // Get.toNamed(Routes.ADD_NOTE);
  }

  fetchSupplierDetails() async {
    isLoading.value = true;
    final result = await supplierRepository.getSupplierById(supplierId);

    result.fold(
      (failure) {
        isLoading.value = false;
      },
      (data) {
        supplier = data;
        isLoading.value = false;
      },
    );
  }

  @override
  void onInit() {
    fetchSupplierDetails();
    super.onInit();
  }

  onEditSupplierTap() {
    Get.toNamed(Routes.ADD_SUPPLIER, arguments: supplier);
  }

  copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: "text")).then((_) {
      if (Platform.isIOS) showSuccessSnackbar(message: "Copied to clipboard");
    });
  }

  onDeleteSupplierTap() async {
    final confirmDeleteAction = await showConfirmationSheet(
      title: 'Delete Supplier',
      content: 'Do you want to delete this supplier?',
    );
    if (confirmDeleteAction == true) {
      isLoading.value = true;
      final result = await supplierRepository.deleteSupplier(supplierId);
      result.fold(
        (failure) {
          isLoading.value = false;
        },
        (data) {
          isLoading.value = false;
          Get.back();
        },
      );
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
