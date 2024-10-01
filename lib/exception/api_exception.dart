import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/exception/app_exception.dart';

class ApiException extends AppException {
  ApiException(super.exception);

  // TODO: Handle to return specific message.
  @override
  String get message {
    assert(exception is DioException, '''
    `exception` is not subtype of [DioException].
    ''');
    final dioException = exception as DioException;
    switch (dioException.response!.statusCode) {
      case 400:
        final message = dioException.response?.data['message'];
        return 'ERROR_400_MESSAGE: $message';
      case 401:
        final message = dioException.response?.data['message'];
        return 'ERROR_401_MESSAGE: $message';
      case 500:
        return 'ERROR_500_MESSAGE';
      default:
        return 'ERROR_DEFAULT_MESSAGE';
    }
  }
}
