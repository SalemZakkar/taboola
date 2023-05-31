import 'package:taboola_user/main_sdk/models/item_filter_parameter.dart';
import 'package:taboola_user/main_sdk/models/meal_category_model.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';

import 'api_identity.dart';

class SearchIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfMealByCategoryAndSearch>> getSearch(ItemsFilterParameters filterParameters) async {

    return apiMethod('/search/',
        httpEnum: HttpEnum.GET,
        queryParameters: filterParameters.toMap(),
        parseJson: (json) => ListOfMealByCategoryAndSearch.fromJson(json));
  }

}
