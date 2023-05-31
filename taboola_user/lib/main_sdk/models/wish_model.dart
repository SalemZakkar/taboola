import 'dart:convert';

import 'meal_category_model.dart';

class ListOfWish {
  ListOfWish({
    this.data,
  });

  ListOfWish.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(WishListResult.fromJson(v));
      });
    }
  }

  List<WishListResult>? data;
}

class WishListResult {
  ResultMeal? meal;
  bool? inCart;

  WishListResult({this.meal, this.inCart});

  WishListResult.fromJson(Map<String, dynamic> json) {
    meal = json['meal'] != null ? ResultMeal.fromJson(json['meal']) : null;
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meal != null) {
      data['meal'] = meal!.toJson();
    }
    data['in_cart'] = inCart;
    return data;
  }
}

class WishModel {
  String? mealId;

  WishModel({
    this.mealId,
  });

  factory WishModel.fromJson(String str) => WishModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WishModel.fromMap(Map<String, dynamic> json) => WishModel(
        mealId: json['meal_id'],
      );

  Map<String, dynamic> toMap() => {
        'meal_id': mealId,
      };
}
