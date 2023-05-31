
import 'package:taboola_user/main_sdk/models/home_models/rating_model.dart';
import 'package:taboola_user/main_sdk/models/message_model.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';

import 'api_identity.dart';

class RateIdentityApi extends ApiModelIdentity {
  // Future<ResponseState<ListOfAddress>> getAddress() async {
  //   return apiMethod('/addresses/',
  //       headers: {'requirestoken': "true"},
  //       httpEnum: HttpEnum.GET,
  //       parseJson: (json) => ListOfAddress.fromJson(json));
  // }
  Future<ResponseState<MessageAddRating>> addRating(Ratings ratings) async {
    return apiMethod('/rating/',
        headers: {'requirestoken': "true"},
        data: ratings.toJsonAddRating(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => MessageAddRating.fromJson(json));
  }
  Future<ResponseState<Message>> deleteRating(Ratings ratings) async {
    return apiMethod('/rating/',
        headers: {'requirestoken': "true"},
        data: ratings.toJsonDeleteRating(),
        httpEnum: HttpEnum.DELETE,
        parseJson: (json) => Message.fromJson(json));
  }
  Future<ResponseState<Message>> editRating(Ratings ratings) async {
    return apiMethod('/rating/',
        headers: {'requirestoken': "true"},
        data: ratings.toJsonEditRating(),
        httpEnum: HttpEnum.PUT,
        parseJson: (json) => Message.fromJson(json));
  }

}
