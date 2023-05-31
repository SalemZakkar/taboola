import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tabola_capten/main_sdk/models/common/result_class.dart';
import 'package:tabola_capten/main_sdk/models/login_model.dart';
import 'package:tabola_capten/main_sdk/models/token.dart';
import 'package:tabola_capten/main_sdk/servisec/identity/identity_service.dart';
import 'package:tabola_capten/main_sdk/utils/tabola_capten_sdk.dart';
import 'package:tabola_capten/local_storage/shared_prefernce_services.dart';



class DioLoggingInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  DioLoggingInterceptors(this._dio);

  DateTime dateTime = DateTime.now();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
        '$dateTime -->'
            ' ${options.method.toUpperCase()} ${options.baseUrl + (options.path)}',
        wrapWidth: 1024);
    print('Headers::::::::::::::${options.headers} ');
    options.headers.forEach((k, v) => debugPrint('$k: $v', wrapWidth: 1024));
    print('queryParameters:');
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v', wrapWidth: 1024));
    if (options.data != null) {
      log('Body: ${options.data}');
    }
    debugPrint('--> END ${options.method.toUpperCase()}', wrapWidth: 1024);

    if (options.headers.containsKey('requirestoken')) {
      options.headers.remove('requirestoken');
      debugPrint('accessToken: ${TaboolaCaptenSDK.token}', wrapWidth: 1024);
     var accessToken = TaboolaCaptenSDK.token;
      options.headers.addAll({'Authorization': '$accessToken'});
    }
    if (options.headers.containsKey('requiresoldtoken')) {
      options.headers.remove('requiresoldtoken');
     debugPrint('accessOldToken: ${TaboolaCaptenSDK.oldToken}', wrapWidth: 1024);
      var accessToken = TaboolaCaptenSDK.oldToken;
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    // if (!options.headers.containsKey('userAgent')) {
    // debugPrint(StoreakSDK.agent, wrapWidth: 1024);
    options.headers.addAll({'userAgent': TaboolaCaptenSDK.agent});
    //}
    print('Final Headers:');
    options.headers.forEach((k, v) => debugPrint('$k: $v', wrapWidth: 1024));
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        '${DateTime.now()} : spend time ${dateTime.difference(DateTime.now())} '
            '<-- ${response.statusCode} ${((response.requestOptions.baseUrl + response.requestOptions.path))}',
        wrapWidth: 1024);
    print('Headers:');
    response.headers.forEach((k, v) => print('$k: $v'));
    log('Response: ${getPrettyJSONString(response.data)}');
    print('Response: ${getPrettyJSONString(response.data)}');
    print('<-- END HTTP');
    super.onResponse(response, handler);
  }

  String getPrettyJSONString(jsonObject) {
    var encoder = const JsonEncoder.withIndent('     ');
    return encoder.convert(jsonObject);
  }

  @override
  Future<void> onError(DioError dioError, ErrorInterceptorHandler handler) async {

    debugPrint('<-- ${dioError.message} ${((dioError.requestOptions.baseUrl + dioError.requestOptions.path))}',
        wrapWidth: 1024);
    debugPrint('${dioError.response != null ? dioError.response!.data : 'Unknown Error'}', wrapWidth: 1024);
    print('<-- End error');

    var responseCode = dioError.response?.statusCode;
    var oldAccessToken = TaboolaCaptenSDK.token;
    if (oldAccessToken != null && responseCode == 401 && !dioError.requestOptions.path.contains('token')) {
      _dio.interceptors.requestLock.lock();
      _dio.interceptors.responseLock.lock();
      var options = dioError.requestOptions;
    var identityService = IdentityService();
    await identityService.postToken(
        LoginModel(
            username: LocalStorageService().username , password:LocalStorageService().password  )
    ).then((value)  {
      if(value is SuccessState<Token>){
        options.headers["Authorization"] = value.data.token;
        TaboolaCaptenSDK.token = value.data.token;
        TaboolaCaptenSDK.oldToken = value.data.token;
        LocalStorageService().token = value.data.token;
      }
    });
      _dio.interceptors.requestLock.unlock();
      _dio.interceptors.responseLock.unlock();
     // await _dio.request(options.path, options: Options(headers: options.headers));
      handler.next(dioError);
    } else {
      super.onError(dioError, handler);
   //   dioError;
    }
  }
}
