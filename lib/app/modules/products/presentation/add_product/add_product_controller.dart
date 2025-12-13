// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/core/enums/product_category_enum.dart';
import 'package:supplier_snap/app/core/services/file_picker_service.dart';
import 'package:supplier_snap/app/modules/products/data/models/product_model.dart';
import 'package:supplier_snap/app/modules/products/data/repository/products_repository.dart';
import 'package:supplier_snap/app/modules/supplier/data/models/supplier_model.dart';
import 'package:supplier_snap/app/utils/bottom_sheets.dart';
import 'package:supplier_snap/app/utils/loading_overlay.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class AddProductViewArgs {
  final SupplierModel? supplier;
  final ProductModel? product;
  const AddProductViewArgs({this.supplier, this.product});
}

class AddProductController extends GetxController {
  final ProductsRepository productsRepository;
  AddProductController({required this.productsRepository});
  final formKey = GlobalKey<FormState>();

  final count = 0.obs;

  RxList<String> images = RxList<String>();
  List<String> imageLocalPaths = []; // Store permanent paths

  // Text editing controllers
  final nameController = TextEditingController();
  final specificationsController = TextEditingController();
  final priceController = TextEditingController();
  final moqController = TextEditingController();
  final moqUnitController = TextEditingController();
  final leadTimeController = TextEditingController();
  final certificationsController = TextEditingController();
  final notesController = TextEditingController();

  late final SupplierModel? supplier = (Get.arguments as AddProductViewArgs)
      .supplier; // Get supplier from arguments

  late final ProductModel? product =
      (Get.arguments as AddProductViewArgs).product;

  late bool isEdit = product != null;
  //onSave variables
  String name = '';
  String specifications = '';
  double price = 0.0;
  int moq = 0;
  String moqUnit = '';
  int leadTimeDays = 0;
  String certifications = '';
  String notes = '';

  ProductCategoryEnum? selectedCategory;

  pickImages() async {
    final filePickerService = Get.find<FilePickerService>();
    isAppLoading = true;
    try {
      final files = await filePickerService.pickMultipleImages();
      if (files != null && files.isNotEmpty) {
        // Save each image to permanent storage
        for (final file in files) {
          final permanentPath = await filePickerService.saveFilePermanently(
            file,
            subdirectory: 'products',
            prefix: 'product',
          );
          if (permanentPath != null) {
            imageLocalPaths.add(permanentPath);
            images.add(permanentPath);
          }
        }
      }
    } finally {
      isAppLoading = false;
    }
  }

  addProduct() async {
    if (selectedCategory == null) {
      showErrorSnackbar(message: 'Please select a product category.');
      return;
    }
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final product = ProductModel(
        name: name,
        price: price,
        specifications: specifications,
        notes: notes,
        leadTimeDays: leadTimeDays,
        supplierId: supplier!.id!,
        moq: moq,
        moqUnit: moqUnit,
        imageLocalPaths: imageLocalPaths,
        category: selectedCategory!,
        imageUrls: [],
        certifications: certifications,
      );

      final result = await productsRepository.createProduct(product);
      result.fold(
        (failure) {
          isAppLoading = false;
          showErrorSnackbar(
            message: 'Failed to add product. Please try again.',
          );
        },
        (createdProduct) {
          isAppLoading = false;

          showAlertSheet(
            title: 'Product Added',
            iconPath: KIcons.tick,
            content: 'Product successfully added to your list.',
          );
          Get.close(2);
        },
      );
    }
  }

  updateProduct() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final updatedProduct = product!.copyWith(
        name: name,
        price: price,
        specifications: specifications,
        notes: notes,
        leadTimeDays: leadTimeDays,
        moq: moq,
        moqUnit: moqUnit,
        imageLocalPaths: imageLocalPaths,
        certifications: certifications,
        category: selectedCategory!,
      );

      final result = await productsRepository.updateProduct(
        updatedProduct.id!,
        updatedProduct,
      );
      result.fold(
        (failure) {
          isAppLoading = false;
          showErrorSnackbar(
            message: 'Failed to update product. Please try again.',
          );
        },
        (product) {
          isAppLoading = false;
          showAlertSheet(
            title: 'Product Updated',
            iconPath: KIcons.tick,
            content: 'Product successfully updated.',
          );
          Get.close(2);
        },
      );
    }
  }

  init() {
    // If editing an existing product, populate fields
    if (product != null) {
      nameController.text = product!.name;
      specificationsController.text = product!.specifications ?? '';
      priceController.text = product!.price.toStringAsFixed(2);
      moqController.text = product!.moq?.toString() ?? '';
      moqUnitController.text = product!.moqUnit ?? '';
      leadTimeController.text = product!.leadTimeDays?.toString() ?? '';
      certificationsController.text = product!.certifications ?? '';
      notesController.text = product!.notes ?? '';
      selectedCategory = product!.category;
      imageLocalPaths = List<String>.from(product!.imageLocalPaths);
      images.addAll(product!.imageLocalPaths);
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose all controllers
    nameController.dispose();
    specificationsController.dispose();
    priceController.dispose();
    moqController.dispose();
    moqUnitController.dispose();
    leadTimeController.dispose();
    certificationsController.dispose();
    notesController.dispose();
    super.onClose();
  }
}
