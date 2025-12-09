import 'package:get/get.dart';
import 'package:supplier_snap/app/modules/profile/data/datasources/profile_local_datasource.dart';
import 'package:supplier_snap/app/modules/profile/data/datasources/profile_remote_datasource.dart';
import 'package:supplier_snap/app/modules/profile/data/repository/profile_repository.dart';

import 'profile_detils_controller.dart';

class ProfileDetilsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileLocalDatasource());
    Get.lazyPut(() => ProfileRemoteDatasource());
    Get.lazyPut(
      () => ProfileRepository(
        remoteSource: Get.find<ProfileRemoteDatasource>(),
        localSource: Get.find<ProfileLocalDatasource>(),
        connectivityService: Get.find(),
        supbaseStorageService: Get.find(),
      ),
    );
    Get.lazyPut<ProfileDetilsController>(
      () => ProfileDetilsController(
        profileRepository: Get.find<ProfileRepository>(),
      ),
    );
  }
}
