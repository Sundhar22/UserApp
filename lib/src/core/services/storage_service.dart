import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_const.dart';

class StorageService {
  late final SharedPreferences pref;

  Future<StorageService> init() async {
    pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await pref.setBool(key, value);
  }

  getDeviceFirstOpen() {
    return pref.getBool(AppStorageConstants.FIRST_TIME_OPEN) ?? true;
  }

  getUserDataSavedStatus() {
    return pref.getBool(AppStorageConstants.USER_DATA_SAVED_STATUS) ?? false;
  }

  setString(String key, String value) async {
    return await pref.setString(key, value);
  }

  getString(String key) {
    return pref.getString(key);
  }
}
