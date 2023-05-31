import 'dart:convert';

import 'dart:io';

class RegisterModel {
  String? password;
  String? username;
  String? firstName;
  String? lastName;
  String? country;
  String? email;
  File? profileImage;

  RegisterModel({
    this.password,
    this.username,
    this.firstName,
    this.lastName,
    this.country,
    this.email,
    this.profileImage,
  });

  factory RegisterModel.fromJson(String str) =>
      RegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
        password: json['password'],
        username: json['username'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        country: json['country'],
        email: json['email'],
        profileImage: json['profile_image'],
      );

  Map<String, dynamic> toMap() => {
        'password': password,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'country': country,
        'email': email,
        'profile_image': profileImage,
      };
}
