import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:taboola_user/local_storage/shared_prefernce_services.dart';
import 'package:taboola_user/main_sdk/models/common/result_class.dart';
import 'package:taboola_user/main_sdk/models/login_model.dart';
import 'package:taboola_user/main_sdk/models/token.dart';
import 'package:taboola_user/main_sdk/servisec/identity/identity_service.dart';
import '/main_sdk/utils/tabola_user_sdk.dart';




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
    debugPrint('Headers:${options.headers} ');
    options.headers.forEach((k, v) => debugPrint('$k: $v', wrapWidth: 1024));
    debugPrint('queryParameters:');
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v', wrapWidth: 1024));
    if (options.data != null) {
      log('Body: ${options.data}');
    }
    debugPrint('--> END ${options.method.toUpperCase()}', wrapWidth: 1024);

    if (options.headers.containsKey('requirestoken')) {
      options.headers.remove('requirestoken');
      debugPrint('accessToken: ${TaboolaUserSDK.token}', wrapWidth: 1024);
     var accessToken = TaboolaUserSDK.token;
      options.headers.addAll({'Authorization': '$accessToken'});
    }
    if (options.headers.containsKey('requiresoldtoken')) {
      options.headers.remove('requiresoldtoken');
     debugPrint('accessOldToken: ${TaboolaUserSDK.oldToken}', wrapWidth: 1024);
      var accessToken = TaboolaUserSDK.oldToken;
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    // if (!options.headers.containsKey('userAgent')) {
    // debugPrint(StoreakSDK.agent, wrapWidth: 1024);
    options.headers.addAll({'userAgent': TaboolaUserSDK.agent});
    //}
    debugPrint('Final Headers:');
    options.headers.forEach((k, v) => debugPrint('$k: $v', wrapWidth: 1024));
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        '${DateTime.now()} : spend time ${dateTime.difference(DateTime.now())} '
            '<-- ${response.statusCode} ${((response.requestOptions.baseUrl + response.requestOptions.path))}',
        wrapWidth: 1024);
    debugPrint('Headers:');
    response.headers.forEach((k, v) => debugPrint('$k: $v'));
    log('Response: ${getPrettyJSONString(response.data)}');
    debugPrint('Response: ${getPrettyJSONString(response.data)}');
    debugPrint('<-- END HTTP');
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
    debugPrint('<-- End error');

    var responseCode = dioError.response?.statusCode;
    var oldAccessToken = TaboolaUserSDK.token;
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
