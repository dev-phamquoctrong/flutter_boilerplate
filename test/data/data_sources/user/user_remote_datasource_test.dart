import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/datasource/remote/user/user_remote_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../data_json_mock/user_mock.dart';
import 'user_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group('Test [UserRemoteDatasource]', () {
    MockDio mockDioClient = MockDio();
    final dataSource = UserRemoteDatasourceImpl(mockDioClient);
    RequestOptions requestOptions = RequestOptions();
    Response mockResponseSuccess = Response(
      requestOptions: requestOptions,
      statusCode: 200,
      data: listOfUserMock,
    );

    // Mock interceptor
    final mockInterceptors = Interceptors();
    when(mockDioClient.interceptors).thenReturn(mockInterceptors);

    test('Fetch success', () async {
      when(mockDioClient.get(any)).thenAnswer((_) async => mockResponseSuccess);
      final actual = await dataSource.fetchUsers();
      expect(actual, isA<Right>());
    });

    test('Fetch error', () async {
      when(mockDioClient.get(any)).thenAnswer(
        (_) async => throw DioException(requestOptions: requestOptions),
      );
      final actual = await dataSource.fetchUsers();
      expect(actual, isA<Left>());
    });
  });
}
