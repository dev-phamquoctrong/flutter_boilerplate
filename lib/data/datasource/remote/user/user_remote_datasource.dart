import 'package:flutter_boilerplate/data/response/network_response.dart';
import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserDatasource {
  Future<Either<Exception, NetworkResponse<UserResponse>>> fetchUsers();
}
