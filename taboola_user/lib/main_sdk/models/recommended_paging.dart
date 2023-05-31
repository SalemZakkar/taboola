import 'package:taboola_user/main_sdk/models/meal_category_model.dart';

class RecommendedPaging {
  List<ResultMeal>? results;

  RecommendedPaging({this.results});

  RecommendedPaging.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ResultMeal>[];
      json['results'].forEach((v) {
        results!.add(ResultMeal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
