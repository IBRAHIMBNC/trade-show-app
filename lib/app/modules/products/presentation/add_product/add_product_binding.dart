import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/products/data/datasources/products_local_datasource.dart';
import 'package:supplier_snap/app/modules/products/data/repository/products_repository.dart';

import 'add_product_controller.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsLocalDatasource>(
      () => ProductsLocalDatasource(database: Get.find()),
    );
    Get.lazyPut<ProductsRepository>(
      () => ProductsRepository(localDatasource: Get.find()),
    );
    Get.lazyPut<AddProductController>(
      () => AddProductController(
        productsRepository: Get.find<ProductsRepository>(),
      ),
    );
  }
}
