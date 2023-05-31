import 'package:taboola_user/main_sdk/models/offer_paging.dart';
import 'package:taboola_user/main_sdk/models/paging_parameter.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';

import 'api_identity.dart';

class OfferIdentityApi extends ApiModelIdentity {
  Future<ResponseState<OfferPaging>> getOffer(PagingParameters pagingParameters) async {
    return apiMethod('/offer_managment/',
        httpEnum: HttpEnum.GET,
        queryParameters: pagingParameters.toMap(),
        parseJson: (json) => OfferPaging.fromJson(json));
  }

}
