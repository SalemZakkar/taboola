import 'package:taboola_user/main_sdk/models/home_models/category_model.dart';
import 'package:taboola_user/main_sdk/models/meal_category_model.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';

import 'api_identity.dart';

class CategoryIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfCategory>> getCategory() async {
    return apiMethod('/categories',
        httpEnum: HttpEnum.GET,
        parseJson: (json) => ListOfCategory.fromJson(json));
  }
  Future<ResponseState<ListOfMealByCategoryAndSearch>> getMealByCategory(String id) async {
    return apiMethod('/search/?category_id=$id',
        httpEnum: HttpEnum.GET,
        parseJson: (json) => ListOfMealByCategoryAndSearch.fromJson(json));
  }

}
