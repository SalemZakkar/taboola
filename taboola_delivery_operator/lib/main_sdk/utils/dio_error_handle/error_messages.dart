


import 'network_exceptions.dart';

class ErrorMessages {
  static String getErrorMessage(NetworkExceptions networkExceptions) {
    String errorMessage = '';
    networkExceptions.when(
        notImplemented: () => errorMessage = 'Not Implemented',
        requestCancelled: () => errorMessage = 'Request Cancelled',
        internalServerError: () => errorMessage = 'Internal Server Error',
        notFound: (reason) => errorMessage = reason,
        serviceUnavailable: () => errorMessage = 'Service unavailable',
        methodNotAllowed: () => errorMessage = 'Method Allowed',
        badRequest: () => errorMessage = 'Bad request',
        unauthorisedRequest: () => errorMessage = 'Unauthorised request',
        unexpectedError: () => errorMessage = 'Unexpected error occurred',
        requestTimeout: () => errorMessage = 'Connection request timeout',
        noInternetConnection: () => errorMessage = 'No internet connection',
        conflict: () => errorMessage = 'Error due to a conflict',
        sendTimeout: () => errorMessage = 'Send timeout in connection with API server',
        unableToProcess: () => errorMessage = 'Unable to process the data',
        defaultError: (error) => errorMessage = error,
        formatException: () => errorMessage = 'Unexpected error occurred',
        notAcceptable: () => errorMessage = 'Not acceptable');
    return errorMessage;
  }
}
