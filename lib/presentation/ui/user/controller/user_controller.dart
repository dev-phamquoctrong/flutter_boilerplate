import 'dart:async';

import 'package:flutter_boilerplate/data/repository/user/user_repository.dart';
import 'package:flutter_boilerplate/data/response/user/user_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final userProvider = AsyncNotifierProvider<UserController, UserResponse>(
  () {
    return UserController(
      GetIt.I.get<UserRepository>(),
    );
  },
);

class UserController extends AsyncNotifier<UserResponse> {
  final UserRepository useCase;

  UserController(this.useCase);

  @override
  Future<UserResponse> build() async {
    final response = await useCase.fetchUsers();
    return response.fold(
      (l) {
        state = AsyncError(l, StackTrace.current);
        return const UserResponse();
      },
      (r) {
        return r.data;
      },
    );
  }
}
