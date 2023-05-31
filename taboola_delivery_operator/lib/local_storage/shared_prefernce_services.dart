import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;
  final String _username = "username";
  final String _password = "password";
  final String _isLoggedIN = "isLoggedIN";
  final String _isDark = "isDark";
  final String _location = "location";
  final String _lang = "lang";
  final String _token = "token";


  static Future<void> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
  }

  bool? get isLoggedIn => _preferences!.getBool(_isLoggedIN);

  String? get password => _preferences!.getString(_password);

  String? get username => _preferences!.getString(_username);

  String? get token => _preferences!.getString(_token);

  bool? get isDark => _preferences!.getBool(_isDark);

  bool? get location => _preferences!.getBool(_location);

  String? get lang => _preferences!.getString(_lang);


  set username(String? value) {
    if (value == null) {
      _preferences!.remove(_username);
      return;
    }
    _preferences!.setString(_username, value);
  }
  set token(String? value) {
    if (value == null) {
      _preferences!.remove(_token);
      return;
    }
    _preferences!.setString(_token, value);
  }
  set lang(String? value) {
    if (value == null) {
      _preferences!.remove(_lang);
      return;
    }
    _preferences!.setString(_lang, value);
  }
  set location(bool? value) {
    if (value == null) {
      _preferences!.remove(_location);
      return;
    }
    _preferences!.setBool(_location, value);
  }
  set isDark(bool? value) {
    if (value == null) {
      _preferences!.remove(_isDark);
      return;
    }
    _preferences!.setBool(_isDark, value);
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
}
