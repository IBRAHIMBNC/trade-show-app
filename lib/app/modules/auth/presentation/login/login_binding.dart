import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/auth/data/datasources/auth_local_datasource.dart';
import 'package:supplier_snap/app/modules/auth/data/datasources/auth_remote_datasource.dart';
import 'package:supplier_snap/app/modules/auth/data/repository/auth_repository.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteDatasource>(() => AuthRemoteDatasource());
    Get.lazyPut<AuthLocalDatasource>(() => AuthLocalDatasource());
    Get.lazyPut(
      () => AuthRepository(
        connectivityService: Get.find(),
        remoteSource: Get.find(),
        localSource: Get.find(),
      ),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(authRepository: Get.find()),
    );
  }
}
