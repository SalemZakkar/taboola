import 'details_meal_model.dart';

class ListOfMealByCategoryAndSearch {
  ListOfMealByCategoryAndSearch({this.data,});

  ListOfMealByCategoryAndSearch.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(MealByCategoryResult.fromJson(v));
      });
    }
  }
  List<MealByCategoryResult>? data;

}


class MealByCategoryResult {
  ResultMeal? meal;
  List<MealImages>? mealImages;

  MealByCategoryResult({this.meal, this.mealImages});

  MealByCategoryResult.fromJson(Map<String, dynamic> json) {
    meal = json['meal'] != null ?  ResultMeal.fromJson(json['meal']) : null;
    if (json['meal_images'] != null) {
      mealImages =  <MealImages>[];
      json['meal_images'].forEach((v) {
        mealImages!.add( MealImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (meal != null) {
      data['meal'] = meal!.toJson();
    }
    if (mealImages != null) {
      data['meal_images'] = mealImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultMeal {
  String? mealName;
  String? mealNameAr;
  String? mealId;
  String? mealDescription;
  String? mealDescriptionAr;
  num? mealRating;
  num? customerMealPrice;
  num? supermarketMealPrice;
  num? agentMealPrice;
  num? restaurantMealPrice;
  num? companyMealPrice;
  String? mealMainImage;

  ResultMeal(
      {this.mealName,
        this.mealNameAr,
        this.mealId,
        this.mealDescription,
        this.mealDescriptionAr,
        this.mealRating,
        this.customerMealPrice,
        this.supermarketMealPrice,
        this.agentMealPrice,
        this.restaurantMealPrice,
        this.companyMealPrice,
        this.mealMainImage});

  ResultMeal.fromJson(Map<String, dynamic> json) {
    mealName = json['meal_name'];
    mealNameAr = json['meal_name_ar'];
    mealId = json['meal_id'];
    mealDescription = json['meal_description'];
    mealDescriptionAr = json['meal_description_ar'];
    mealRating = json['meal_rating'];
    customerMealPrice = json['customer_meal_price'];
    supermarketMealPrice = json['supermarket_meal_price'];
    agentMealPrice = json['agent_meal_price'];
    restaurantMealPrice = json['restaurant_meal_price'];
    companyMealPrice = json['company_meal_price'];
    mealMainImage = json['meal_main_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['meal_name'] = mealName;
    data['meal_name_ar'] = mealNameAr;
    data['meal_id'] = mealId;
    data['meal_description'] = mealDescription;
    data['meal_description_ar'] = mealDescriptionAr;
    data['meal_rating'] = mealRating;
    data['customer_meal_price'] = customerMealPrice;
    data['supermarket_meal_price'] = supermarketMealPrice;
    data['agent_meal_price'] = agentMealPrice;
    data['restaurant_meal_price'] = restaurantMealPrice;
    data['company_meal_price'] =companyMealPrice;
    data['meal_main_image'] = mealMainImage;
    return data;
  }
}
