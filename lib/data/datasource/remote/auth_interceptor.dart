import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/datasource/remote/api_endpoint.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    // const authorization = 'Bearer [YOUR_TOKEN]';
    // options.headers = {'Authorization': _authorization};
    options.baseUrl = APIEndpoint.baseUrl;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
