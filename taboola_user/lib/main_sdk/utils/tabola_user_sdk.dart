import 'dart:collection';

import 'package:taboola_user/main_sdk/models/token.dart';



class TaboolaUserSDK {
  static String? token;
  static Token? tokenAllData;
 static String? oldToken;
  static String? languageCode;
  static String? password;
  static String? username;
  static String? agent;


  TaboolaUserSDK.init(
      {
      String? password,
      String? username,
      String? languageCode,
      }) {

    TaboolaUserSDK.agent ??= agent;

  }



  TaboolaUserSDK.login({
    required String password,
    required String username,
  })
  {
    TaboolaUserSDK.username = username;
    TaboolaUserSDK.password = password;
  }

  Map<String, dynamic> _transform(Map json) {
    var clone = Map<String, dynamic>.from(json);
    json.forEach((key, value) {
      clone.remove(key);
      clone[_toLowerCaseFirst(key)] = (value is LinkedHashMap<String, dynamic>) ? _transform(Map.from(value)) : value;
    });

    return clone;
  }

  String _toLowerCaseFirst(String s) => s[0].toLowerCase() + s.substring(1);


}
