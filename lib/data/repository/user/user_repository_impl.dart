import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../datasource/remote/user/user_remote_datasource.dart';
import '../../response/network_response.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, NetworkResponse<UserResponse>>> fetchUsers() {
    return datasource.fetchUsers();
  }
}
