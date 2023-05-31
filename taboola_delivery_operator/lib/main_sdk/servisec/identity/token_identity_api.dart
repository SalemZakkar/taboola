import 'package:dio/dio.dart';
import 'package:tabola_capten/main_sdk/enum/http_enum.dart';
import 'package:tabola_capten/main_sdk/models/common/result_class.dart';
import 'package:tabola_capten/main_sdk/models/login_model.dart';
import 'package:tabola_capten/main_sdk/models/register_moedl.dart';
import 'package:tabola_capten/main_sdk/models/token.dart';
import 'package:tabola_capten/main_sdk/utils/tabola_capten_sdk.dart';

import 'api_identity.dart';

class TokenIdentityApi extends ApiModelIdentity {
  Future<ResponseState<Token>> getToken(LoginModel loginBody) async {
    //  TaboolaCaptenSDK.agent ??= await FlutterUserAgent.getPropertyAsync('userAgent');

    return apiMethod('/delivery_login/',
        headers: {'userAgent': TaboolaCaptenSDK.agent},
        data: loginBody.toJson(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Token.fromJson(json));
  }

  Future<ResponseState<Token>> signUp(RegisterModel registerModel) async {
    print(registerModel.password);
    print(registerModel.email);
    print(registerModel.profileImage.toString());
    //  TaboolaCaptenSDK.agent ??= await FlutterUserAgent.getPropertyAsync('userAgent');
    return apiMethod('/customer_register/',
        headers: {'userAgent': TaboolaCaptenSDK.agent},
        //data: registerModel.toJson(),
        dataMedia: FormData.fromMap(registerModel.toMap()),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Token.fromJson(json));
  }
}
