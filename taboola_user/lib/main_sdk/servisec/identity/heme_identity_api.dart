
import 'package:taboola_user/main_sdk/models/home_model.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';

import 'api_identity.dart';

class HomeIdentityApi extends ApiModelIdentity {

  Future<ResponseState<Home>> getHome() async {
    return apiMethod('/home/',
        //headers: {'requirestoken': "true"},

        httpEnum: HttpEnum.GET,
        parseJson: (json) => Home.fromJson(json));
  }


}