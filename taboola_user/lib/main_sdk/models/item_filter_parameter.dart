

class ItemsFilterParameters  {

  String? mealName;
  String? mealNameAr;
  String? categoryId;
  num? mealRating;
  num? minPrice;
  num? maxPrice;


  ItemsFilterParameters({

    this.mealName,
    this.mealNameAr,
    this.mealRating,
    this.categoryId,
    this.maxPrice,
    this.minPrice,


  }) ;

  Map<String, dynamic> toMap() {
    return {
      'meal_name': mealName,
      'meal_name_ar': mealNameAr,
      'meal_rating': mealRating,
      'category_id': categoryId,
      'max_price': maxPrice,
      'min_price': minPrice,

    }
      ..removeWhere((key, value) => value == null)
      ..map((key, value) => MapEntry(key.toUpperCase(), value));
  }

  ItemsFilterParameters copyWith({
    String? mealName,
    String? mealNameAr,
    String? categoryId,
    num? mealRating,
    num? minPrice,
    num? maxPrice,

  }) {
    return ItemsFilterParameters(
      mealName: mealName ?? this.mealName,
      mealNameAr: mealNameAr ?? this.mealNameAr,
      categoryId: categoryId ?? this.categoryId,
      mealRating: mealRating ?? this.mealRating,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,

    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ItemsFilterParameters &&
              runtimeType == other.runtimeType &&
              mealName == other.mealName ;
  @override
  int get hashCode =>

      mealName.hashCode

  ;
}