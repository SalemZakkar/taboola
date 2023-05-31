import 'package:taboola_user/main_sdk/models/cart_model.dart';
import 'package:taboola_user/main_sdk/models/home_models/meal_model.dart';
import 'package:taboola_user/main_sdk/models/message_model.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';

import 'api_identity.dart';

class CartIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfCart>> getCart() async {
    return apiMethod('/cart/',
        headers: {'requirestoken': "true"},
        httpEnum: HttpEnum.GET,
        parseJson: (json) => ListOfCart.fromJson(json));
  }

  Future<ResponseState<Message>> addToCart(Meal meal) async {
    return apiMethod('/add_to_cart/',
        headers: {'requirestoken': "true"},
        data: meal.toJsonCart(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Message.fromJson(json));
  }

  Future<ResponseState<Message>> increaseAmountOfCart(Meal meal) async {
    return apiMethod('/increase_meal_amount/',
        headers: {'requirestoken': "true"},
        data: meal.toJsonCart(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Message.fromJson(json));
  }

  Future<ResponseState<Message>> deleteFromCart(Meal meal) async {
    return apiMethod('/remove_from_cart/',
        headers: {'requirestoken': "true"},
        data: meal.toJsonCart(),
        httpEnum: HttpEnum.DELETE,
        parseJson: (json) => Message.fromJson(json));
  }

  Future<ResponseState<Message>> removeAmountOfCart(Meal meal) async {
    return apiMethod('/decrease_meal_amount/',
        headers: {'requirestoken': "true"},
        data: meal.toJsonCart(),
        httpEnum: HttpEnum.DELETE,
        parseJson: (json) => Message.fromJson(json));
  }
}
