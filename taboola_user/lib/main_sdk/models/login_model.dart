import 'dart:convert';

class LoginModel {
  String? password;

  String? username;

  LoginModel({
    this.password,
    this.username,
  });

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        password: json['password'],
        username: json['username'],
      );

  Map<String, dynamic> toMap() => {
        'password': password,
        'username': username,
      };
}
