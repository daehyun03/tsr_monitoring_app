import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsr_monitoring_app/util/constants.dart';

class UniqueSharedPreference {
  static late final SharedPreferences _instance;

  static void init() async {
    _instance = await SharedPreferences.getInstance();
    setString('selectedIndex', '0');
    setString('selectedUnit', avgList[0]);
  }

  static String getString(String key, [String? defValue]) {
    return _instance.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value) ?? Future.value(false);
  }
}