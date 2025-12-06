import 'package:get/get.dart';

import 'product_listing_controller.dart';

class ProductListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListingController>(
      () => ProductListingController(),
    );
  }
}
