import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/modules/supplier/add_supplier/widgets/add_contact_info_section.dart';
import 'package:supplier_snap/app/modules/supplier/add_supplier/widgets/add_supplier_info_section.dart';
import 'package:supplier_snap/app/modules/supplier/add_supplier/widgets/scoring_section.dart';
import 'package:supplier_snap/app/utils/bottom_sheets.dart';

class AddSupplierController extends GetxController {
  final addSupplerInfoFormKey = GlobalKey<FormState>();
  final addContactInfoFormKey = GlobalKey<FormState>();

  // Add Supplier Info Controllers
  final fullNameController = TextEditingController();
  final companyController = TextEditingController();
  final boothController = TextEditingController();
  final locationController = TextEditingController();

  // Add Contact Info Controllers
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final wechatController = TextEditingController();
  final whatsappController = TextEditingController();

  String selectedIndustry = 'Select Industry';
  String selectedInterestLevel = 'Interest Level';

  final RxInt selectedIndex = 0.obs;

  List<Widget> get sections => [
    const AddSupplierInfoSection(), // AddSupplierInfoSection
    const AddContactInfoSection(), // AddContactInfo
    const ScoringSection(), // ScoringSection
  ];

  onNext() async {
    if (selectedIndex.value < 2) {
      if (selectedIndex.value == 0) {
        if (addSupplerInfoFormKey.currentState!.validate()) {
          selectedIndex.value++;
        }
      } else if (selectedIndex.value == 1) {
        if (addContactInfoFormKey.currentState!.validate()) {
          selectedIndex.value++;
        }
      }
    } else {
      await showAlertSheet(
        title: 'Supplier Added',
        imagePath: KIcons.tick,
        content: 'Supplier successfully added to your list.',
      );
      Get.until((route) => route.isFirst);
    }
  }

  onBack() {
    if (selectedIndex.value > 0) {
      selectedIndex.value--;
    } else {
      Get.back();
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    companyController.dispose();
    boothController.dispose();
    locationController.dispose();

    emailController.dispose();
    phoneController.dispose();
    wechatController.dispose();
    whatsappController.dispose();

    super.dispose();
  }
}
