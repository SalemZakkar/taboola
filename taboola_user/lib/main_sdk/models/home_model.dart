import 'home_models/category_model.dart';
import 'home_models/meal_model.dart';
import 'home_models/rating_model.dart';

class Home {
  List<Categories>? categories;
  List<Meals>? meals;
  List<Ratings>? ratings;

  Home({this.categories, this.meals, this.ratings});

  Home.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories =  <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['meals'] != null) {
      meals =  <Meals>[];
      json['meals'].forEach((v) {
        meals!.add( Meals.fromJson(v));
      });
    }
    if (json['ratings'] != null) {
      ratings =  <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add( Ratings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}








