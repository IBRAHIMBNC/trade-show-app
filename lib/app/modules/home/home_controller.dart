import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';

class HomeController extends GetxController {
  void logout() {
    Supabase.instance.client.auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    print('HomeController initialized');
    super.onInit();
  }
}
