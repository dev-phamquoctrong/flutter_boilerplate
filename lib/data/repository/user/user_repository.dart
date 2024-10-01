import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../response/network_response.dart';

abstract class UserRepository {
  Future<Either<Exception, NetworkResponse<UserResponse>>> fetchUsers();
}
