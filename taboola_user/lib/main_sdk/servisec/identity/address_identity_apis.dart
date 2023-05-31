
import 'package:taboola_user/main_sdk/models/adress_moedl.dart';
import 'package:taboola_user/main_sdk/models/message_model.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';

import 'api_identity.dart';

class AddressIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfAddress>> getAddress() async {
    return apiMethod('/addresses/',
        headers: {'requirestoken': "true"},
        httpEnum: HttpEnum.GET,
        parseJson: (json) => ListOfAddress.fromJson(json));
  }
  Future<ResponseState<AddAddress>> addAddress(Addresses addresses) async {
    return apiMethod('/manage_addresses/',
        headers: {'requirestoken': "true"},
        data: addresses.toJsonAddAddress(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => AddAddress.fromJson(json));
  }
  Future<ResponseState<Message>> deleteAddress(Addresses addresses) async {
    return apiMethod('/manage_addresses/',
        headers: {'requirestoken': "true"},
        data: addresses.toJsonDeleteAddress(),
        httpEnum: HttpEnum.DELETE,
        parseJson: (json) => Message.fromJson(json));
  }
  Future<ResponseState<Message>> editAddress(Addresses addresses) async {
    return apiMethod('/manage_addresses/',
        headers: {'requirestoken': "true"},
        data: addresses.toJsonEdit(),
        httpEnum: HttpEnum.PUT,
        parseJson: (json) => Message.fromJson(json));
  }

}
