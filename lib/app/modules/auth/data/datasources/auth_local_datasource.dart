import 'package:get/instance_manager.dart';
import 'package:supplier_snap/app/core/models/app_user.dart';
import 'package:supplier_snap/app/core/services/shared_prefrences_service.dart';

class AuthLocalDatasource {
  final sharedPrefs = Get.find<SharedPrefrencesService>();

  Future<void> cacheUser(appUser) async {
    await sharedPrefs.saveAppUser(appUser);
  }

  Future<AppUser?> getCachedUser() async {
    return sharedPrefs.getAppUser();
  }
}
