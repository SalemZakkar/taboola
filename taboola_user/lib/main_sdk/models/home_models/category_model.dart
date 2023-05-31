class ListOfCategory {
  ListOfCategory({this.data,});

  ListOfCategory.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(CategoryResult.fromJson(v));
      });
    }
  }
  List<CategoryResult>? data;

}



class CategoryResult {
  Categories? category;
  int? mealsCount;

  CategoryResult({this.category, this.mealsCount});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ?  Categories.fromJson(json['category'])
        : null;
    mealsCount = json['meals_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['meals_count'] = mealsCount;
    return data;
  }
}

class Categories {
  String? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;

  Categories(
      {this.categoryId,
        this.categoryName,
        this.categoryNameAr,
        this.categoryImage});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_name_ar'] = categoryNameAr;
    data['category_image'] = categoryImage;
    return data;
  }
}