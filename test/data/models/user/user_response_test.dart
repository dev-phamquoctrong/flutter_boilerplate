import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data_json_mock/user_mock.dart';

void main() {
  group(
    'Test [UserResponse]',
    () {
      final result = UserResponse.fromJson(listOfUserMock);
      test(
        '[fromJson] function',
        () {
          expect(result, isA<UserResponse>());
        },
      );
    },
  );
}
