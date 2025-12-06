import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/supplier/supplier_detail/widgets/info_tab.dart';
import 'package:supplier_snap/app/modules/supplier/supplier_detail/widgets/remarks_tab.dart';
import 'package:supplier_snap/app/modules/supplier/supplier_detail/widgets/scoring_tab.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';

class SupplierDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final tabController = TabController(length: 3, vsync: this);
  final RxInt tabIndex = 0.obs;

  List<Widget> get tabViews => [ScoringTab(), InfoTab(), RemarksTab()];

  gotoProductListing() {
    Get.toNamed(Routes.PRODUCT_LISTING);
  }

  gotoFiles() {
    // Get.toNamed(Routes.PRODUCT_LISTING);
  }

  gotoNotes() {
    Get.toNamed(Routes.PRODUCT_LISTING);
  }

  goToAddProduct() {
    Get.toNamed(Routes.ADD_PRODUCT);
  }

  gotoAddFile() {
    // Get.toNamed(Routes.ADD_FILE);
  }
  gotoAddNote() {
    // Get.toNamed(Routes.ADD_NOTE);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
