import 'dart:async';


import 'package:taboola_user/main_sdk/models/register_moedl.dart';

import '/main_sdk/utils/tabola_user_sdk.dart';

import '/main_sdk/models/common/result_class.dart';
import '/main_sdk/models/login_model.dart';
import '/main_sdk/models/token.dart';


import 'token_identity_api.dart';



class IdentityService {
  final TokenIdentityApi _apiToken = TokenIdentityApi();

  //<editor-fold desc='Token' defaultstate='expanded'>
  ///ID=1
  Future<ResponseState<Token>> postToken(LoginModel loginBody) async {
    var token = await _apiToken.getToken(loginBody);
    if (token is SuccessState<Token>) {

     TaboolaUserSDK.token = token.data.token;
     TaboolaUserSDK.tokenAllData = token.data;
     TaboolaUserSDK.oldToken = token.data.token;

    }
    return token;
  }


  Future<ResponseState<Token>> signUpToken(RegisterModel registerModel) async {
    var token = await _apiToken.signUp(registerModel);
    if (token is SuccessState<Token>) {
      TaboolaUserSDK.token = token.data.token;
      TaboolaUserSDK.tokenAllData = token.data;
    }
    return token;
  }
}