import 'dart:convert';

import 'category_model.dart';


class ListOfMeal {
  List<Meal>? meals;

  ListOfMeal({this.meals});

  ListOfMeal.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Meal>[];
      json['meals'].forEach((v) {
        meals!.add(Meal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  Meal? meal;
  List<MealImages>? mealImages;

  Meals({this.meal, this.mealImages});

  Meals.fromJson(Map<String, dynamic> json) {
    meal = json['meal'] != null ? Meal.fromJson(json['meal']) : null;
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
    if (mealImages != null) {
      data['meal_images'] = mealImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meal {
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
  bool? inCart;
  bool? inWishlist;
  String? mealMainImage;


  Meal(
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
      this.inCart,
      this.inWishlist,
      this.mealMainImage});

  Meal.fromJson(Map<String, dynamic> json) {
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
    inCart = json['in_cart'];
    inWishlist = json['in_wishlist'];
    mealMainImage = json['meal_main_image'];
  }

  String toJsonCart() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'meal_id': mealId,
      };

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
    data['in_cart'] = inCart;
    data['in_wishlist'] = inWishlist;
    data['meal_main_image'] = mealMainImage;
    return data;
  }
}

class MealOffers {
  String? offerId;
  String? offerName;
  String? offerNameAr;
  num? supermarketCustomerOfferPrice;
  num? agentCustomerOfferPrice;
  num? companyCustomerOfferPrice;
  num? restuarantCustomerOfferPrice;
  String? normalCustomerOfferDescription;
  String? supermarketCustomerOfferDescription;
  String? agentCustomerOfferDescription;
  String? companyCustomerOfferDescription;
  String? restuarantCustomerOfferDescription;
  String? normalCustomerOfferDescriptionAr;
  String? supermarketCustomerOfferDescriptionAr;
  String? agentCustomerOfferDescriptionAr;
  String? companyCustomerOfferDescriptionAr;
  String? restuarantCustomerOfferDescriptionAr;
  String? offerImage;
  String? createdAt;
  String? meal;

  MealOffers(
      {this.offerId,
      this.offerName,
      this.offerNameAr,
      this.supermarketCustomerOfferPrice,
      this.agentCustomerOfferPrice,
      this.companyCustomerOfferPrice,
      this.restuarantCustomerOfferPrice,
      this.normalCustomerOfferDescription,
      this.supermarketCustomerOfferDescription,
      this.agentCustomerOfferDescription,
      this.companyCustomerOfferDescription,
      this.restuarantCustomerOfferDescription,
      this.normalCustomerOfferDescriptionAr,
      this.supermarketCustomerOfferDescriptionAr,
      this.agentCustomerOfferDescriptionAr,
      this.companyCustomerOfferDescriptionAr,
      this.restuarantCustomerOfferDescriptionAr,
      this.offerImage,
      this.createdAt,
      this.meal});

  MealOffers.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    offerName = json['offer_name'];
    offerNameAr = json['offer_name_ar'];
    supermarketCustomerOfferPrice = json['supermarket_customer_offer_price'];
    agentCustomerOfferPrice = json['agent_customer_offer_price'];
    companyCustomerOfferPrice = json['company_customer_offer_price'];
    restuarantCustomerOfferPrice = json['restuarant_customer_offer_price'];
    normalCustomerOfferDescription = json['normal_customer_offer_description'];
    supermarketCustomerOfferDescription =
        json['supermarket_customer_offer_description'];
    agentCustomerOfferDescription = json['agent_customer_offer_description'];
    companyCustomerOfferDescription =
        json['company_customer_offer_description'];
    restuarantCustomerOfferDescription =
        json['restuarant_customer_offer_description'];
    normalCustomerOfferDescriptionAr =
        json['normal_customer_offer_description_ar'];
    supermarketCustomerOfferDescriptionAr =
        json['supermarket_customer_offer_description_ar'];
    agentCustomerOfferDescriptionAr =
        json['agent_customer_offer_description_ar'];
    companyCustomerOfferDescriptionAr =
        json['company_customer_offer_description_ar'];
    restuarantCustomerOfferDescriptionAr =
        json['restuarant_customer_offer_description_ar'];
    offerImage = json['offer_image'];
    createdAt = json['created_at'];
    meal = json['meal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offer_id'] = offerId;
    data['offer_name'] = offerName;
    data['offer_name_ar'] = offerNameAr;
    data['supermarket_customer_offer_price'] = supermarketCustomerOfferPrice;
    data['agent_customer_offer_price'] = agentCustomerOfferPrice;
    data['company_customer_offer_price'] = companyCustomerOfferPrice;
    data['restuarant_customer_offer_price'] = restuarantCustomerOfferPrice;
    data['normal_customer_offer_description'] = normalCustomerOfferDescription;
    data['supermarket_customer_offer_description'] =
        supermarketCustomerOfferDescription;
    data['agent_customer_offer_description'] = agentCustomerOfferDescription;
    data['company_customer_offer_description'] =
        companyCustomerOfferDescription;
    data['restuarant_customer_offer_description'] =
        restuarantCustomerOfferDescription;
    data['normal_customer_offer_description_ar'] =
        normalCustomerOfferDescriptionAr;
    data['supermarket_customer_offer_description_ar'] =
        supermarketCustomerOfferDescriptionAr;
    data['agent_customer_offer_description_ar'] =
        agentCustomerOfferDescriptionAr;
    data['company_customer_offer_description_ar'] =
        companyCustomerOfferDescriptionAr;
    data['restuarant_customer_offer_description_ar'] =
        restuarantCustomerOfferDescriptionAr;
    data['offer_image'] = offerImage;
    data['created_at'] = createdAt;
    data['meal'] = meal;
    return data;
  }
}

class MealIngredients {
  String? ingredientName;
  String? ingredientNameAr;

  MealIngredients({this.ingredientName, this.ingredientNameAr});

  MealIngredients.fromJson(Map<String, dynamic> json) {
    ingredientName = json['ingredient_name'];
    ingredientNameAr = json['ingredient_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ingredient_name'] = ingredientName;
    data['ingredient_name_ar'] = ingredientNameAr;
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
