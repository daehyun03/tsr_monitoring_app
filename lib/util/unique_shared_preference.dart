import 'package:shared_preferences/shared_preferences.dart';

class UniqueSharedPreference {
  static late final SharedPreferences _instance;

  static Future<SharedPreferences> init() async {
    return _instance = await SharedPreferences.getInstance();
  }

  static String getString(String key, [String? defValue]) {
    return _instance.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value) ?? Future.value(false);
  }
}