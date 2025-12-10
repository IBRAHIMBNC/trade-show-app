import 'package:get/get.dart';
import 'package:supplier_snap/app/constants/k_icons.dart';
import 'package:supplier_snap/app/modules/products/data/models/product_model.dart';
import 'package:supplier_snap/app/modules/products/data/repository/products_repository.dart';
import 'package:supplier_snap/app/modules/products/presentation/add_product/add_product_controller.dart';
import 'package:supplier_snap/app/modules/supplier/presentation/supplier_detail/supplier_detail_controller.dart';
import 'package:supplier_snap/app/routes/app_pages.dart';
import 'package:supplier_snap/app/utils/bottom_sheets.dart';

class ProductListingController extends GetxController {
  final ProductsRepository productsRepository;
  ProductListingController({required this.productsRepository});

  final RxList<ProductModel> products = <ProductModel>[].obs;

  final int supplierId = Get.find<SupplierDetailController>().supplier.id!;

  goToAddProduct() {
    final supplier = Get.find<SupplierDetailController>().supplier;
    Get.toNamed(
      Routes.ADD_PRODUCT,
      arguments: AddProductViewArgs(supplier: supplier),
    );
  }

  getToProductDetails(ProductModel product) {
    Get.toNamed(Routes.PRODUCT_DETAILS);
  }

  onProductDelete(int productId) {
    showConfirmationSheet(
      title: 'Delete Product',
      iconPath: KIcons.delete,
      content: 'Are you sure you want to delete this product?',
    ).then((confirmed) {
      if (confirmed != null && confirmed) {
        productsRepository.deleteProduct(productId);
      }
    });
  }

  @override
  void onInit() {
    products.bindStream(
      productsRepository.watchProductsBySupplierId(supplierId),
    );
    super.onInit();
  }
}
