import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/supplier/data/datasources/supplier_local_datasource.dart';
import 'package:supplier_snap/app/modules/supplier/data/datasources/supplier_remote_datasource.dart';
import 'package:supplier_snap/app/modules/supplier/data/repository/supplier_repository.dart';

import 'supplier_detail_controller.dart';

class SupplierDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupplierLocalDatasource(database: Get.find()));
    Get.lazyPut(() => SupplierRemoteDatasource());

    Get.lazyPut(
      () => SupplierRepository(
        localSource: Get.find<SupplierLocalDatasource>(),
        remoteSource: Get.find<SupplierRemoteDatasource>(),
        connectivityService: Get.find(),
      ),
    );
    Get.lazyPut<SupplierDetailController>(
      () => SupplierDetailController(
        supplierRepository: Get.find<SupplierRepository>(),
      ),
    );
  }
}
