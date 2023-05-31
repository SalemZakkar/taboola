import 'package:taboola_user/main_sdk/models/message_model.dart';
import 'package:taboola_user/main_sdk/models/wish_model.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';

import 'api_identity.dart';

class WishListIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfWish>> getWish() async {
    return apiMethod('/wishlist/',
        headers: {'requirestoken': "true"},
        httpEnum: HttpEnum.GET,
        parseJson: (json) => ListOfWish.fromJson(json));
  }

  Future<ResponseState<Message>> addWish(WishModel wishModel) async {
    return apiMethod('/edit_wishlist/',
        headers: {'requirestoken': "true"},
        data: wishModel.toJson(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Message.fromJson(json));
  }

  Future<ResponseState<Message>> deleteWish(WishModel wishModel) async {
    return apiMethod('/edit_wishlist/',
        headers: {'requirestoken': "true"},
        data: wishModel.toJson(),
        httpEnum: HttpEnum.DELETE,
        parseJson: (json) => Message.fromJson(json));
  }
}
