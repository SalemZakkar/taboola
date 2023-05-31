import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;
  final String _username = "username";
  final String _password = "password";
  final String _isLoggedIN = "isLoggedIN";
  final String _isDark = "isDark";
  final String _lang = "lang";
  final String _keySearch = "keySearch";
  final String _onBoarding = "onBoarding";

  static Future<void> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
  }

  bool? get isLoggedIn => _preferences!.getBool(_isLoggedIN);
  bool? get onBoarding => _preferences!.getBool(_onBoarding);

  String? get password => _preferences!.getString(_password);

  String? get username => _preferences!.getString(_username);

  String? get lang => _preferences!.getString(_lang);

  bool? get isDark => _preferences!.getBool(_isDark);

  set username(String? value) {
    if (value == null) {
      _preferences!.remove(_username);
      return;
    }
    _preferences!.setString(_username, value);
  }
  set darkMode(bool? value) {
    if (value == null) {
      _preferences!.remove(_isDark);
      return;
    }
    _preferences!.setBool(_isDark, value);
  }
  set language(String? value) {
    if (value == null) {
      _preferences!.remove(_lang);
      return;
    }
    _preferences!.setString(_lang, value);
  }
  set password(String? value) {
    if (value == null) {
      _preferences!.remove(_password);
      return;
    }
    _preferences!.setString(_password, value);
  }

  set isLoggedIn(bool? value) {
    if (value == null) {
      _preferences!.remove(_isLoggedIN);
      return;
    }
    _preferences!.setBool(_isLoggedIN, value);
  }
  set onBoarding(bool? value) {
    if (value == null) {
      _preferences!.remove(_onBoarding);
      return;
    }
    _preferences!.setBool(_onBoarding, value);
  }


  String? get keySearch => _preferences!.getString(_keySearch);
  Future<bool> setSearch(value) async {
    if (value == null) {
      return _preferences!.remove(_keySearch);
    } else {
      return await _preferences!.setString(_keySearch, value);
    }
  }
}
