class CategoryPaging {
  // int? count;
  // String? next;
  // String? previous;
  List<Results>? results;

  CategoryPaging({/*this.count, this.next, this.previous,*/ this.results});

  CategoryPaging.fromJson(Map<String, dynamic> json) {
    // count = json['count'];
    // next = json['next'];
    // previous = json['previous'];
    if (json['results'] != null) {
      results =  <Results>[];
      json['results'].forEach((v) {
        results!.add( Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    // data['count'] = count;
    // data['next'] = next;
    // data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Results {
  String? categoryId;
  String? categoryName;
  String? categoryImage;

  Results({this.categoryId, this.categoryName, this.categoryImage});

  Results.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_image'] = categoryImage;
    return data;
  }
}