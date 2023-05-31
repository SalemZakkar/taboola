import 'dart:async';


import 'package:tabola_capten/local_storage/shared_prefernce_services.dart';
import 'package:tabola_capten/main_sdk/models/common/result_class.dart';
import 'package:tabola_capten/main_sdk/models/login_model.dart';
import 'package:tabola_capten/main_sdk/models/register_moedl.dart';
import 'package:tabola_capten/main_sdk/models/token.dart';
import 'package:tabola_capten/main_sdk/utils/tabola_capten_sdk.dart';

import 'token_identity_api.dart';



class IdentityService {
  final TokenIdentityApi _apiToken = TokenIdentityApi();

  //<editor-fold desc='Token' defaultstate='expanded'>
  ///ID=1
  Future<ResponseState<Token>> postToken(LoginModel loginBody) async {
    var token = await _apiToken.getToken(loginBody);
    if (token is SuccessState<Token>) {

     TaboolaCaptenSDK.token = token.data.token;
     TaboolaCaptenSDK.oldToken = token.data.token;
     LocalStorageService().token = token.data.token;

    }
    return token;
  }


  Future<ResponseState<Token>> signUpToken(RegisterModel registerModel) async {
    var token = await _apiToken.signUp(registerModel);
    if (token is SuccessState<Token>) {
      TaboolaCaptenSDK.token = token.data.token;
      LocalStorageService().token = token.data.token;

    }
    return token;
  }
}