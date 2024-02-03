import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_app/src/core/constants/app_const.dart';

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
    return pref.getBool(AppConstants.FIRST_TIME_OPEN) ?? false;
  }
}
