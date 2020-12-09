import 'package:shared_preferences/shared_preferences.dart';

class SharedDb {
  static SharedDb _sharedDb;
  static SharedPreferences _preferences;

  static Future<SharedDb> getInstance() async {
    if (_sharedDb == null) {
      var secureStorage = SharedDb._();
      await secureStorage._init();
      _sharedDb = secureStorage;
    }
    return _sharedDb;
  }

  SharedDb._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Get data
  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString(key) ?? defValue;
  }

  // Put data
  static Future<bool> putString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences.setString(key, value);
  }

  // Check if logged in
  static Future<bool> isLoggedIn() async {
    return _preferences.getBool('username') ?? false;
  }

  //Clear data
  static Future<bool> clrString() {
    SharedPreferences prefs = _preferences;
    prefs.clear();
  }
}
