import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final count = 0.obs;

  List<String> images = [];

  // Text editing controllers
  final nameController = TextEditingController();
  final specificationsController = TextEditingController();
  final priceController = TextEditingController();
  final moqController = TextEditingController();
  final leadTimeController = TextEditingController();
  final certificationsController = TextEditingController();
  final notesController = TextEditingController();

  void increment() => count.value++;

  pickImages() {}

  addProduct() {
    if (formKey.currentState!.validate()) {
      // Process the data
    }
  }

  @override
  void onClose() {
    // Dispose all controllers
    nameController.dispose();
    specificationsController.dispose();
    priceController.dispose();
    moqController.dispose();
    leadTimeController.dispose();
    certificationsController.dispose();
    notesController.dispose();
    super.onClose();
  }
}
