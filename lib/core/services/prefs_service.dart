import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefsService {
  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static bool? getBool(String key) => _prefs.getBool(key) ?? false;

  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String? getString(String key) => _prefs.getString(key) ?? '';
}
