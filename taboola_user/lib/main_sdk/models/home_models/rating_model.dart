import 'dart:convert';

class ListOfRating {
  ListOfRating({
    this.data,
  });

  ListOfRating.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(Ratings.fromJson(v));
      });
    }
  }

  List<Ratings>? data;
}

class Ratings {
  String? ratingId;
  Customer? customer;
  String? ratingContent;
  num? ratingValue;
  String? createdAt;
  String? mealRated;
  String? mealId;
  Ratings(
      {this.ratingId,
        this.customer,
        this.ratingContent,
        this.ratingValue,
        this.createdAt,
        this.mealRated,
        this.mealId});

  Ratings.fromJson(Map<String, dynamic> json) {
    ratingId = json['rating_id'];
    customer = json['customer'] != null
        ?  Customer.fromJson(json['customer'])
        : null;
    ratingContent = json['rating_content'];
    ratingValue = json['rating_value'];
    createdAt = json['created_at'];
    mealRated = json['meal_rated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['rating_id'] = ratingId;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['rating_content'] = ratingContent;
    data['rating_value'] = ratingValue;
    data['created_at'] = createdAt;
    data['meal_rated'] = mealRated;
    return data;
  }
  String toJsonAddRating() => json.encode(toMapAddRating());

  Map<String, dynamic> toMapAddRating() => {
    'rating_content': ratingContent,
    'rating_value': ratingValue,
    'meal_id': mealId,
  };

  String toJsonEditRating() => json.encode(toMapEditRating());

  Map<String, dynamic> toMapEditRating() => {
    'rating_content': ratingContent,
    'rating_value': ratingValue,
    'meal_id': mealId,
    'rating_id': ratingId,
  };

  String toJsonDeleteRating() => json.encode(toMapDeleteRating());

  Map<String, dynamic> toMapDeleteRating() => {
    'meal_id': mealId,
    'rating_id': ratingId,
  };
}

class Customer {
  User? user;
  String? customerId;
  String? profileImage;
  String? role;
  String? phoneNumber;

  Customer(
      {this.user,
      this.customerId,
      this.profileImage,
      this.role,
      this.phoneNumber});

  Customer.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    customerId = json['customer_id'];
    profileImage = json['profile_image'];
    role = json['role'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['customer_id'] = customerId;
    data['profile_image'] = profileImage;
    data['role'] = role;
    data['phone_number'] = phoneNumber;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;

  User({this.id, this.username, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}

class MessageAddRating {
  String? message;
  String? ratingId;

  MessageAddRating({this.message});

  MessageAddRating.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    ratingId = json['rating_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['rating_id'] = ratingId;
    return data;
  }
}
