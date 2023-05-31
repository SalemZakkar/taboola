

import 'package:tabola_capten/main_sdk/enum/http_enum.dart';
import 'package:tabola_capten/main_sdk/models/common/result_class.dart';
import 'package:tabola_capten/main_sdk/models/message_model.dart';
import 'package:tabola_capten/main_sdk/models/order_paging_model.dart';
import 'package:tabola_capten/main_sdk/models/paging_parameter.dart';
import 'api_identity.dart';

class OrderIdentityApi extends ApiModelIdentity {
  Future<ResponseState<OrderPaging>> getFreeDelivery(
      PagingParameters pagingParameters) async {
    return apiMethod('/unoccupied_deliveries',
        headers: {'requirestoken': "true"},
        httpEnum: HttpEnum.GET,
        queryParameters: pagingParameters.toMap(),
        parseJson: (json) => OrderPaging.fromJson(json));
  }
  Future<ResponseState<OrderPaging>> getMyDelivery(
      PagingParameters pagingParameters) async {
    return apiMethod('/my_deliveries',
        headers: {'requirestoken': "true"},
        httpEnum: HttpEnum.GET,
        queryParameters: pagingParameters.toMap(),
        parseJson: (json) => OrderPaging.fromJson(json));
  }

  Future<ResponseState<Message>> pikOrder(Results results) async {
    return apiMethod('/start_delivery/',
        headers: {'requirestoken': "true"},
        data: results.toJsonGetDelivery(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Message.fromJson(json));
  }
  Future<ResponseState<Message>> updateLocation(Results results) async {
    return apiMethod('/update_location/',
        headers: {'requirestoken': "true"},
        data: results.toJsonUpdateLocation(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Message.fromJson(json));
  }
  Future<ResponseState<Message>> updateLocationWithToken(Results results , String token) async {
    return apiMethod('/update_location/',
        headers: {'Authorization': token},
        data: results.toJsonUpdateLocation(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Message.fromJson(json));
  }
  Future<ResponseState<Message>> finishDelivery(Results delivery , bool success) async {
    return apiMethod('/end_delivery/',
        headers: {'requirestoken': "true"},
        data:success? delivery.toJsonFinishOrder():delivery.toJsonFinishOrderNo(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Message.fromJson(json));
  }
}
