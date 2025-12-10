import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/products/data/models/product_model.dart';
import 'package:supplier_snap/app/modules/products/presentation/add_product/add_product_controller.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';

class ProductDetailsController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final currentImageIndex = 0.obs;

  late ProductModel product = Get.arguments as ProductModel;

  List<String> get images => [...product.imageLocalPaths];

  onEditProdut() {
    Get.toNamed(
      Routes.ADD_PRODUCT,
      arguments: AddProductViewArgs(product: product),
    );
  }

  @override
  void onClose() {
    carouselController.dispose();
    super.onClose();
  }
}
