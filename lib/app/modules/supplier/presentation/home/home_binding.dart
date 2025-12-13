import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/supplier/data/datasources/supplier_local_datasource.dart';
import 'package:supplier_snap/app/modules/supplier/data/datasources/supplier_remote_datasource.dart';
import 'package:supplier_snap/app/modules/supplier/data/repository/supplier_repository.dart';
import 'package:supplier_snap/app/modules/supplier/data/services/supplier_card_service.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // // Products
    // Get.lazyPut(() => ProductsLocalDatasource(database: Get.find()));
    // Get.lazyPut(
    //   () => ProductsRepository(
    //     localDatasource: Get.find<ProductsLocalDatasource>(),
    //   ),
    // );

    // // Documents
    // Get.lazyPut(() => DocumentsLocalDatasource(database: Get.find()));
    // Get.lazyPut(
    //   () => DocumentsRepository(
    //     localDatasource: Get.find<DocumentsLocalDatasource>(),
    //   ),
    // );

    // // Notes Data Sources
    // Get.lazyPut(() => NotesLocalDatasource(database: Get.find()));
    // Get.lazyPut(
    //   () => NotesRepository(localDatasource: Get.find<NotesLocalDatasource>()),
    // );

    Get.lazyPut(() => SupplierCardService(database: Get.find()));

    // Supplier
    Get.lazyPut(() => SupplierLocalDatasource(database: Get.find()));
    Get.lazyPut(() => SupplierRemoteDatasource());

    Get.lazyPut(
      () => SupplierRepository(
        localSource: Get.find<SupplierLocalDatasource>(),
        remoteSource: Get.find<SupplierRemoteDatasource>(),
        connectivityService: Get.find(),
      ),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(supplierRepository: Get.find<SupplierRepository>()),
    );
  }
}
