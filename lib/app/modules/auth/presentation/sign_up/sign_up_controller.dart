import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/auth/data/repository/auth_repository.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class SignUpController extends GetxController {
  SignUpController({required this.authRepository});

  final RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final AuthRepository authRepository;

  String name = '';
  String email = '';
  String password = '';

  void signUp() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isLoading.value = true;
      final result = await authRepository.signUp(email, password, {
        'full_name': name,
      });
      result.fold(
        (failure) {
          isLoading.value = false;
          showErrorSnackbar(failure.message);
        },
        (appUser) {
          isLoading.value = false;
          Get.offAllNamed(Routes.NAVIGATION);
        },
      );
    }
  }
}
