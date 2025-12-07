import 'package:get/get.dart';

import 'profile_detils_controller.dart';

class ProfileDetilsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDetilsController>(() => ProfileDetilsController());
  }
}
