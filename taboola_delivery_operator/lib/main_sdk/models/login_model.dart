import 'dart:convert';




class LoginModel {

 // String? username;
  String? password;

  String? username;


  LoginModel({

   // this.username,
    this.password,
    this.username,

  }) ;

  factory LoginModel.fromJson(String str) => LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(

      //  username: json['Username'],
        password: json['password'],

        username: json['username'],
      //  language: json['Language'],

      );

  Map<String, dynamic> toMap() => {

        //'Username': username,
        'password': password,

        'username': username,
       // 'Language': language == null ? null : language?.index,

      };
}
