import 'package:taboola_user/main_sdk/models/details_meal_model.dart';
import 'package:taboola_user/main_sdk/models/paging_parameter.dart';
import 'package:taboola_user/main_sdk/models/recommended_paging.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';

import 'api_identity.dart';

class MealIdentityApi extends ApiModelIdentity {
  Future<ResponseState<RecommendedPaging>> getRecommended(PagingParameters pagingParameters) async {
    return apiMethod('/meals/',
        httpEnum: HttpEnum.GET,
        queryParameters: pagingParameters.toMap(),
        parseJson: (json) => RecommendedPaging.fromJson(json));
  }
  Future<ResponseState<DetailsMeal>> getDetailsMeal(String id) async {
    var a = {"meal_id":"4b0df208-d0b4-4271-971a-c997db7536e6"};

    return apiMethod('/meal/$id/',
        httpEnum: HttpEnum.GET,
        parseJson: (json) => DetailsMeal.fromJson(json));
  }

}
