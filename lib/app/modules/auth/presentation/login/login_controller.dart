import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier_snap/app/core/services/sync/sync_service.dart';
import 'package:supplier_snap/app/modules/auth/data/repository/auth_repository.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/utils/snackbars.dart';

class LoginController extends GetxController {
  LoginController({required this.authRepository});
  final AuthRepository authRepository;
  final formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;

  String email = '';
  String password = '';

  void signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isLoading.value = true;
      final result = await authRepository.signIn(email, password);
      result.fold(
        (failure) {
          showErrorSnackbar(message: failure.message);
          isLoading.value = false;
        },
        (userEmail) {
          isLoading.value = false;
          // Trigger initial sync after login
          Get.find<SyncService>().onUserLoggedIn();
          Get.offAllNamed(Routes.NAVIGATION);
        },
      );
    }
  }
}
