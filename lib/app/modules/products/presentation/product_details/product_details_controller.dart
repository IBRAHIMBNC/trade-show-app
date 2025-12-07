import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/utils/my_utils.dart';

class ProductDetailsController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final currentImageIndex = 0.obs;

  List<String> get images => [
    // Sample image URLs
    MyUtils.getTempLink(),
    MyUtils.getTempLink(),
    MyUtils.getTempLink(),
  ];

  @override
  void onClose() {
    carouselController.dispose();
    super.onClose();
  }
}
