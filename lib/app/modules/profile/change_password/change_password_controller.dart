import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String oldPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  // final log = getLogger('ChangePasswordViewModel');
  String? validateConfirmPassword(String? val) {
    if (val!.isEmpty) {
      return 'Please enter confirm password';
    }
    if (val != newPassword) {
      return 'Password do not match';
    }
    return null;
  }

  changePassword() async {
    if (formKey.currentState!.validate()) {
      // // isAppLoading = true;
      // final result = await authService.changePassword(oldPassword, newPassword);
      // isAppLoading = false;
      // if (result == true) {
      //   Get.back();
      //   showSuccessSnackBar(
      //     title: 'Passowrd Changed',
      //     message: 'Password changed successfully',
      //   );
      //   return;
      // }
      // formKey.currentState!.reset();
      // showErrorSnackBar(
      //   title: 'Password Change Failed',
      //   message: authService.authError?.msg ?? 'Unknown error',
      // );
    }
  }
}
