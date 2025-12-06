import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/core/services/auth_service.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final supabaseClient = Supabase.instance.client;

  init() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (AuthService.instance.isUserLoggedIn) {
          Get.offAllNamed(Routes.NAVIGATION);
          return;
        }
        Get.offAllNamed(Routes.LOGIN);
      });
    });
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
