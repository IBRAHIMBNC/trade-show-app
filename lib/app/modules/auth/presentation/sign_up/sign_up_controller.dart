import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/core/services/sync/sync_service.dart';
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
          showErrorSnackbar(message: failure.message);
        },
        (appUser) {
          isLoading.value = false;
          // Trigger initial sync after signup
          Get.find<SyncService>().onUserLoggedIn();
          Get.offAllNamed(Routes.NAVIGATION);
        },
      );
    }
  }
}
