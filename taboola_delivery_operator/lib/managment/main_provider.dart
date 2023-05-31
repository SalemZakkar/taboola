import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tabola_capten/main_sdk/models/common/result_class.dart';
import 'package:tabola_capten/main_sdk/models/login_model.dart';
import 'package:tabola_capten/main_sdk/models/register_moedl.dart';
import 'package:tabola_capten/main_sdk/models/token.dart';
import 'package:tabola_capten/main_sdk/servisec/identity/identity_service.dart';
import 'package:tabola_capten/local_storage/shared_prefernce_services.dart';



class DataBaseProvider with ChangeNotifier {

  double totalPrice = 0.0;
  bool isLogin = false;
  Future<ResponseState<Token>>? tokenResponse;


  DataBaseProvider() {
   if(LocalStorageService().isLoggedIn ?? false) {
     tokenResponse = tokenApi();
   }
  }

  Future<ResponseState<Token>> tokenApi() async {
    isLogin = LocalStorageService().isLoggedIn ?? false;
    LoginModel loginModel = LoginModel();
   // loginModel.email ="admin";
  //  loginModel.password = "admin";
    if (isLogin) {
      loginModel.username = LocalStorageService().username;
      loginModel.password = LocalStorageService().password;

    }
    return IdentityService().postToken(loginModel).then((on) async {
      if (on is SuccessState<Token>) {

      }
      return on;
    });
  }
  //
  Future<ResponseState<Token>> loginApi(String username, String passwordNew) async {
    username.trim();
    passwordNew.trim();

    return IdentityService()
        .postToken(LoginModel(
            username: username,
            password: passwordNew,))
        .then((on) async {
      if (on is SuccessState<Token>) {
        isLogin = true;

        LocalStorageService().isLoggedIn = true;
        LocalStorageService().username = username;
        LocalStorageService().password = passwordNew;
        notifyListeners();
      }
      return on;
    });
  }
  Future<ResponseState<Token>> signUpApi(
      String userEmail,
      String userName,
      String passwordNew,
      String firsName,
      String lastName,
      String userCountry,
      File image) async {
    userEmail.trim();
    passwordNew.trim();
    firsName.trim();
    lastName.trim();
    userCountry.trim();
    userName.trim();

    return IdentityService()
        .signUpToken(RegisterModel(
        email: userEmail,
        password: passwordNew,
        firstName: firsName,
        lastName: lastName,
        username: userName,
        country: userCountry,
      profileImage: image))
        .then((on) async {
      if (on is SuccessState<Token>) {
        isLogin = true;
        LocalStorageService().isLoggedIn = true;
        LocalStorageService().username = userEmail;
        LocalStorageService().password = passwordNew;
        notifyListeners();
      }
      return on;
    });
  }

  void logout() {
    isLogin = false;
    LocalStorageService().isLoggedIn = false;
    LocalStorageService().username = null;
    LocalStorageService().password = null;
    notifyListeners();
  }





}
