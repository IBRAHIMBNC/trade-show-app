import 'package:get/get.dart';
import 'package:supplier_snap/app/core/services/shared_prefrences_service.dart';

class ProfileLocalDatasource {
  final sharedPrefs = Get.find<SharedPrefrencesService>();

  Future<void> clearUserData() async {
    await sharedPrefs.clearUserData();
  }

  Future<void> saveAppUserData(String userJson) async {
    await sharedPrefs.saveUser(SharedPrefrencesService.userKey, userJson);
  }

  Future<String?> getAppUserData() async {
    return sharedPrefs.getAppUser()?.toJson();
  }
}
