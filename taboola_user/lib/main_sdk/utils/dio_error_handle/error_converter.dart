import 'dart:io';

import 'package:dio/dio.dart';

import 'error_messages.dart';
import 'network_exceptions.dart';


class ErrorConverter {
  static NetworkExceptions _getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions? networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.other:
              networkExceptions = NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              switch (error.response?.statusCode ?? 0) {
                case 400:
                  networkExceptions = const NetworkExceptions.unauthorisedRequest();
                  break;
                case 401:
                  networkExceptions =const NetworkExceptions.unauthorisedRequest();
                  break;
                case 403:
                  networkExceptions =const NetworkExceptions.unauthorisedRequest();
                  break;
                case 404:
                  networkExceptions =const NetworkExceptions.notFound('Not found');
                  break;
                case 409:
                  networkExceptions =const NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions =const NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions =const NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions =const NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response?.statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    'Received invalid status code: $responseCode',
                  );
              }
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String errorToHumanReadableString(DioError e) {
    return ErrorMessages.getErrorMessage(_getDioException(e));
  }
}
