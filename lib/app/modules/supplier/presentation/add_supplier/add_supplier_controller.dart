import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/core/enums/industry_type_enum.dart';
import 'package:supplier_snap/app/core/enums/interest_level_enum.dart';
import 'package:supplier_snap/app/core/failures/failures.dart';
import 'package:supplier_snap/app/core/services/file_picker_service.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';
import 'package:supplier_snap/app/modules/supplier/data/repository/supplier_repository.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/add_supplier/widgets/add_contact_info_section.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/add_supplier/widgets/add_supplier_info_section.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/add_supplier/widgets/scoring_section.dart';
import 'package:supplier_snap/app/utils/bottom_sheets.dart';
import 'package:supplier_snap/app/utils/loading_overlay.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class AddSupplierController extends GetxController {
  final SupplierRepository supplierRepository;
  AddSupplierController({required this.supplierRepository});

  final addSupplerInfoFormKey = GlobalKey<FormState>();
  final addContactInfoFormKey = GlobalKey<FormState>();
  final scoringFormKey = GlobalKey<FormState>();

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

  // Scoring Controllers
  final remarksController = TextEditingController();

  // On Saved Variables

  String fullName = '';
  String company = '';
  String booth = '';
  String? location;
  String email = '';
  String? phone;
  String? weChatID;
  String? whatsAppNumber;
  String? remarks;

  //=================

  InterestLevelEnum? selectedInterestLevel;
  IndustryTypeEnum? industryEnum;

  Rxn<File> selectedImage = Rxn<File>();

  String? imageUrl;
  String? imageLocalPath; // Store permanent path

  late SupplierModel? supplier = Get.arguments as SupplierModel?;

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
          addSupplerInfoFormKey.currentState!.save();
          selectedIndex.value++;
        }
      } else if (selectedIndex.value == 1) {
        if (addContactInfoFormKey.currentState!.validate()) {
          addContactInfoFormKey.currentState!.save();
          selectedIndex.value++;
        }
      }
    } else {
      if (!scoringFormKey.currentState!.validate()) return;
      scoringFormKey.currentState!.save();
      final result = await (supplier != null ? onUpdate() : onAdd());

      result.fold(
        (error) {
          showErrorSnackbar(
            message: 'Failed to add supplier. Please try again.',
          );
        },
        (supplier) async {
          await showAlertSheet(
            title: 'Supplier Added',
            iconPath: KIcons.tick,
            content: 'Supplier successfully added to your list.',
          );
          Get.until((route) => route.isFirst);
        },
      );
    }
  }

  onBack() {
    if (selectedIndex.value > 0) {
      selectedIndex.value--;
    } else {
      Get.back();
    }
  }

  Future<Either<Failure, SupplierModel>> onUpdate() {
    final updatedSupplier = SupplierModel(
      userId: supplier!.userId,
      name: fullName,
      company: company,
      booth: booth,
      address: location,
      email: email,
      phone: phone,
      weChatID: weChatID,
      whatsAppNumber: whatsAppNumber,
      notes: remarks,
      industry: industryEnum,
      interestLevel: selectedInterestLevel != 'Interest Level'
          ? selectedInterestLevel
          : null,
      createdAt: supplier!.createdAt,
      updatedAt: DateTime.now(),
      imageUrl: imageUrl,
      imageLocalPath: imageLocalPath ?? supplier!.imageLocalPath,
    );
    return supplierRepository.updateSupplier(supplier!.id!, updatedSupplier);
  }

  Future<Either<Failure, SupplierModel>> onAdd() {
    final supplier = SupplierModel(
      userId: '', // Assign current user ID here
      name: fullName,
      company: company,
      booth: booth,
      address: location,
      email: email,
      phone: phone,
      weChatID: weChatID,
      whatsAppNumber: whatsAppNumber,
      notes: remarks,
      industry: industryEnum,
      interestLevel: selectedInterestLevel,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      imageUrl: imageUrl,
      imageLocalPath: imageLocalPath,
    );
    return supplierRepository.createSupplier(supplier);
  }

  init() {
    if (supplier != null) {
      // Editing existing supplier
      fullNameController.text = supplier!.name;
      companyController.text = supplier!.company;
      boothController.text = supplier!.booth;
      locationController.text = supplier!.address ?? '';

      emailController.text = supplier!.email ?? '';
      phoneController.text = supplier!.phone ?? '';
      wechatController.text = supplier!.weChatID ?? '';
      whatsappController.text = supplier!.whatsAppNumber ?? '';

      remarksController.text = supplier!.notes ?? '';

      imageUrl = supplier!.imageUrl;
      imageLocalPath = supplier!.imageLocalPath;
      selectedImage.value = supplier!.imageLocalPath != null
          ? File(supplier!.imageLocalPath!)
          : null;

      industryEnum = supplier!.industry;
      selectedInterestLevel = supplier!.interestLevel;
    }
  }

  pickImage() async {
    final filePickerService = Get.find<FilePickerService>();
    isAppLoading = true;

    try {
      final file = await filePickerService.pickImageFromGallery();
      if (file != null) {
        // Save to permanent storage
        final permanentPath = await filePickerService.saveFilePermanently(file);
        if (permanentPath != null) {
          // Delete old image if exists
          if (imageLocalPath != null) {
            await filePickerService.deletePermanentFile(imageLocalPath!);
          }

          imageLocalPath = permanentPath;
          selectedImage.value = File(permanentPath);
        }
      }
    } finally {
      isAppLoading = false;
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
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
