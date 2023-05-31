import 'package:taboola_user/main_sdk/models/message_model.dart';
import 'package:taboola_user/main_sdk/models/submit_order_model.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';

import 'api_identity.dart';

class OrderAndCheckOutIdentityApi extends ApiModelIdentity {
  // Future<ResponseState<ListOfAddress>> getAddress() async {
  //   return apiMethod('/addresses/',
  //       headers: {'requirestoken': "true"},
  //       httpEnum: HttpEnum.GET,
  //       parseJson: (json) => ListOfAddress.fromJson(json));
  // }
  Future<ResponseState<Message>> SubmitSingleOrder(SubmitSingleOrderModel  submitSingleOrderModel) async {
    return apiMethod('/submit_single_order/',
        headers: {'requirestoken': "true"},
        data: submitSingleOrderModel.toJson(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Message.fromJson(json));
  }
  Future<ResponseState<Message>> SubmitMultiOrder(SubmitMultiOrderModel submitMultiOrderModel) async {
    return apiMethod('/submit_order/',
        headers: {'requirestoken': "true"},
        data: submitMultiOrderModel.toJson(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Message.fromJson(json));
  }
  // Future<ResponseState<Message>> editAddress(Addresses addresses) async {
  //   return apiMethod('/manage_addresses/',
  //       headers: {'requirestoken': "true"},
  //       data: addresses.toJsonEdit(),
  //       httpEnum: HttpEnum.PUT,
  //       parseJson: (json) => Message.fromJson(json));
  // }

}
