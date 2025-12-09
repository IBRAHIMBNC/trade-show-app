import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/profile/presentation/delete_account/delete_account_success.dart';

class DeleteAccountController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String password = '';
  String reason = '';

  deleteAccount() {
    if (formKey.currentState!.validate()) {
      Get.to(() => const DeleteAccountSuccess());
    }
  }
}
