import 'package:shared_preferences/shared_preferences.dart';
import 'package:supplier_snap/app/core/models/app_user.dart';

class SharedPrefrencesService {
  late final SharedPreferences _preferences;

  static const String userKey = 'app_user';

  Future<SharedPrefrencesService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> saveUser(String key, String value) async {
    await _preferences.setString(key, value);
  }

  Future<void> saveAppUser(AppUser appUser) async {
    await _preferences.setString(userKey, appUser.toJson());
  }

  AppUser? getAppUser() {
    final userJson = _preferences.getString(userKey);
    if (userJson != null) {
      return AppUser.fromJson(userJson);
    }
    return null;
  }

  Future<void> clearUserData() async {
    await _preferences.remove(userKey);
  }
}
