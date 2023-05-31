
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:taboola_user/main_sdk/models/information_user_model.dart';
import 'package:taboola_user/main_sdk/models/message_model.dart';
import 'package:taboola_user/main_sdk/models/register_moedl.dart';
import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';
import '/main_sdk/models/login_model.dart';
import '/main_sdk/models/token.dart';


import 'api_identity.dart';


class TokenIdentityApi extends ApiModelIdentity {
  Future<ResponseState<Token>> getToken(LoginModel loginBody) async {
    return apiMethod('/customer_login/',
       // headers: {'userAgent': TaboolaUserSDK.agent},
        data: loginBody.toJson(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Token.fromJson(json));
  }
  Future<ResponseState<Token>> signUp(RegisterModel registerModel) async {
    return apiMethod('/customer_register/',
      //  headers: {'userAgent': TaboolaUserSDK.agent},
        data: registerModel.toJson(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => Token.fromJson(json));
  }
  Future<ResponseState<InfoUser>> getInformationUser() async {
    return apiMethod('/customer_details',
        headers: {'requirestoken': "true"},
        httpEnum: HttpEnum.GET,
        parseJson: (json) => InfoUser.fromJson(json));
  }
  Future<ResponseState<Message>> editDataUser(User user) async {
    return apiMethod('/edit_profile/',
        headers: {'requirestoken': "true"},
        data: user.toJsonEditFirstAndLastName(),
        httpEnum: HttpEnum.PUT,
        parseJson: (json) => Message.fromJson(json));
  }
  Future<ResponseState<Message>> editPassword(User user) async {
    return apiMethod('/edit_profile/',
        headers: {'requirestoken': "true"},
        data: user.toJsonEditPassword(),
        httpEnum: HttpEnum.PUT,
        parseJson: (json) => Message.fromJson(json));
  }
  Future<ResponseState<Message>> editProfileImage(File file) async {
    FormData formData = FormData.fromMap(
      {
        "profile_image":await MultipartFile.fromFile(file.path , filename: file.path)
      }
    );
    return apiMethod('/edit_profile_image/',
        headers: {'requirestoken': "true"},
        dataMedia: formData,
        httpEnum: HttpEnum.PUT,
        parseJson: (json) => Message.fromJson(json));
  }

}
