import 'dart:collection';



class TaboolaCaptenSDK {
  static String? token;
 static String? oldToken;
  static String? languageCode;
  static String? password;
  static String? username;
  static String? agent;


  TaboolaCaptenSDK.init(
      {
      String? password,
      String? username,
      String? languageCode,
      }) {

    TaboolaCaptenSDK.agent ??= agent;

  }



  TaboolaCaptenSDK.login({
    required String password,
    required String username,
  })
  {
    TaboolaCaptenSDK.username = username;
    TaboolaCaptenSDK.password = password;
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
