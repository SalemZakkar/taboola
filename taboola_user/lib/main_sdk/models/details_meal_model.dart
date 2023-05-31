import 'home_models/category_model.dart';
import 'home_models/meal_model.dart';
import 'home_models/rating_model.dart';

class DetailsMeal {
  MealDetails? meal;
  List<Ratings>? ratings;
  List<MealImages>? mealImages;

  DetailsMeal({this.meal, this.ratings, this.mealImages});

  DetailsMeal.fromJson(Map<String, dynamic> json) {
    meal = json['meal'] != null ? MealDetails.fromJson(json['meal']) : null;
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(Ratings.fromJson(v));
      });
    }
    if (json['meal_images'] != null) {
      mealImages = <MealImages>[];
      json['meal_images'].forEach((v) {
        mealImages!.add(MealImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meal != null) {
      data['meal'] = meal!.toJson();
    }
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    if (mealImages != null) {
      data['meal_images'] = mealImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MealDetails {
  String? mealId;
  Categories? mealCategory;
  List<MealOffers>? mealOffers;
  List<MealIngredients>? mealIngredients;
  String? mealName;
  String? mealNameAr;
  String? mealDescription;
  String? mealDescriptionAr;
  num? customerMealPrice;
  num? supermarketMealPrice;
  num? agentMealPrice;
  num? restaurantMealPrice;
  num? companyMealPrice;
  num? mealPoints;
  num? mealRating;
  num? mealOrderTimes;
  String? mealMainImage;

  MealDetails(
      {this.mealId,
      this.mealCategory,
      this.mealOffers,
      this.mealIngredients,
      this.mealName,
      this.mealNameAr,
      this.mealDescription,
      this.mealDescriptionAr,
      this.customerMealPrice,
      this.supermarketMealPrice,
      this.agentMealPrice,
      this.restaurantMealPrice,
      this.companyMealPrice,
      this.mealPoints,
      this.mealRating,
      this.mealOrderTimes,
      this.mealMainImage});

  MealDetails.fromJson(Map<String, dynamic> json) {
    mealId = json['meal_id'];
    mealCategory = json['meal_category'] != null
        ? Categories.fromJson(json['meal_category'])
        : null;
    if (json['meal_offers'] != null) {
      mealOffers = <MealOffers>[];
      json['meal_offers'].forEach((v) {
        mealOffers!.add(MealOffers.fromJson(v));
      });
    }
    if (json['meal_ingredients'] != null) {
      mealIngredients = <MealIngredients>[];
      json['meal_ingredients'].forEach((v) {
        mealIngredients!.add(MealIngredients.fromJson(v));
      });
    }
    mealName = json['meal_name'];
    mealNameAr = json['meal_name_ar'];
    mealDescription = json['meal_description'];
    mealDescriptionAr = json['meal_description_ar'];
    customerMealPrice = json['customer_meal_price'];
    supermarketMealPrice = json['supermarket_meal_price'];
    agentMealPrice = json['agent_meal_price'];
    restaurantMealPrice = json['restaurant_meal_price'];
    companyMealPrice = json['company_meal_price'];
    mealPoints = json['meal_points'];
    mealRating = json['meal_rating'];
    mealOrderTimes = json['meal_order_times'];
    mealMainImage = json['meal_main_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meal_id'] = mealId;
    if (mealCategory != null) {
      data['meal_category'] = mealCategory!.toJson();
    }
    if (mealOffers != null) {
      data['meal_offers'] = mealOffers!.map((v) => v.toJson()).toList();
    }
    if (mealIngredients != null) {
      data['meal_ingredients'] =
          mealIngredients!.map((v) => v.toJson()).toList();
    }
    data['meal_name'] = mealName;
    data['meal_name_ar'] = mealNameAr;
    data['meal_description'] = mealDescription;
    data['meal_description_ar'] = mealDescriptionAr;
    data['customer_meal_price'] = customerMealPrice;
    data['supermarket_meal_price'] = supermarketMealPrice;
    data['agent_meal_price'] = agentMealPrice;
    data['restaurant_meal_price'] = restaurantMealPrice;
    data['company_meal_price'] = companyMealPrice;
    data['meal_points'] = mealPoints;
    data['meal_rating'] = mealRating;
    data['meal_order_times'] = mealOrderTimes;
    data['meal_main_image'] = mealMainImage;
    return data;
  }
}

class MealImages {
  String? imageId;
  String? image;

  MealImages({this.imageId, this.image});

  MealImages.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_id'] = imageId;
    data['image'] = image;
    return data;
  }
}
