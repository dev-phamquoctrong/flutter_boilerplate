import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/exception/app_exception.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../exception/api_exception.dart';
import '../exception/default_exception.dart';
import 'datasource/remote/auth_interceptor.dart';
import 'response/network_response.dart';
import 'response/pagination_response.dart';

enum NetworkMethod {
  get,
  post,
  put,
  patch,
  delete,
}

typedef NetworkSuccessCallBack<T> = T Function(Response response);
typedef NetworkErrorCallBack<E> = E Function(DioException exception);

class NetworkClient {
  final Dio dio;

  NetworkClient(this.dio);

  void _addInterceptor({
    bool addAuthentication = true,
    bool addDioLog = true,
  }) {
    if (addAuthentication) {
      dio.interceptors.add(AuthInterceptor());
    }
    if (addDioLog) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: kDebugMode,
          // Example [filter]
          // filter: (options, args) {
          //   if (options.path.contains('/posts')) {
          //     return false;
          //   }
          //   return !args.isResponse || !args.hasUint8ListData;
          // },
        ),
      );
    }
  }

  // `onError` used to custom specific exception.
  Future<Either<AppException, NetworkResponse<T>>>
      call<T, E extends AppException>({
    required String endpoint,
    required NetworkMethod method,
    required NetworkSuccessCallBack<T> onSuccess,
    NetworkErrorCallBack<E>? onError,
    bool addAuthentication = true,
    bool addDioLog = true,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      _addInterceptor(
        addAuthentication: addAuthentication,
        addDioLog: addDioLog,
      );
      late final Response<dynamic> response;
      switch (method) {
        case NetworkMethod.get:
          response = await dio.get(endpoint);
          break;
        case NetworkMethod.post:
          response = await dio.post(
            endpoint,
            data: data,
            options: options,
          );
          break;
        case NetworkMethod.put:
          response = await dio.put(endpoint);
          break;
        case NetworkMethod.patch:
          response = await dio.patch(endpoint);
          break;
        case NetworkMethod.delete:
          response = await dio.delete(endpoint);
          break;
      }
      final result = onSuccess(response);
      final pagination = PaginationResponse.fromJson(response.data);
      return Right(
        NetworkResponse(
          result,
          pagination: pagination,
        ),
      );
    } on DioException catch (e) {
      if (onError != null) {
        return Left(onError(e));
      }
      return Left(ApiException(e));
    } on Exception catch (e) {
      return Left(DefaultException(e));
    }
  }
}
