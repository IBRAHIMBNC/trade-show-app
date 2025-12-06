import 'package:get/get.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';

class ProductListingController extends GetxController {
  goToAddProduct() {
    Get.toNamed(Routes.ADD_PRODUCT);
  }

  getToProductDetails() {
    Get.toNamed(Routes.PRODUCT_DETAILS);
  }
}
