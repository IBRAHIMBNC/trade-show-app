import 'package:get/get.dart';

import 'comparison_controller.dart';

class ComparisonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComparisonController>(() => ComparisonController());
  }
}
