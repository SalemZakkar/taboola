import 'dart:convert';

import 'package:taboola_user/main_sdk/models/adress_moedl.dart';

class Token {
  CustomerData? customerData;
  String? token;

  Token({this.customerData, this.token});

  Token.fromJson(Map<String, dynamic> json) {
    customerData = json['Customer Data'] != null
        ?  CustomerData.fromJson(json['Customer Data'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (customerData != null) {
      data['Customer Data'] = customerData!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class CustomerData {
  String? customerId;
  User? user;
  List<Addresses>? addresses;
  double? points;
  String? country;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  String? role;

  CustomerData(
      {this.customerId,
        this.user,
        this.addresses,
        this.points,
        this.country,
        this.createdAt,
        this.updatedAt,
        this.profileImage,
        this.role});

  CustomerData.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    if (json['addresses'] != null) {
      addresses =  <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add( Addresses.fromJson(v));
      });
    }
    points = json['points'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['customer_id'] = customerId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    data['points'] = points;
    data['country'] = country;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_image'] = profileImage;
    data['role'] = role;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? dateJoined;
  String? password;
  String? newPassword;
  bool? isStaff;

  User(
      {this.id,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.dateJoined,
        this.newPassword,
        this.password,
        this.isStaff});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateJoined = json['date_joined'];
    isStaff = json['is_staff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['date_joined'] = dateJoined;
    data['is_staff'] = isStaff;
    return data;
  }

  String toJsonEditFirstAndLastName() => json.encode(toMapEditFirstAndLastName());
  Map<String, dynamic> toMapEditFirstAndLastName() => {
    'first_name': firstName,
    'last_name': lastName,
  };
  String toJsonEditPassword() => json.encode(toMapEditPassword());
  Map<String, dynamic> toMapEditPassword() => {
    'password': password,
    'new_password': newPassword,
  };
}



