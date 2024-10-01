import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/datasource/remote/user/user_remote_datasource_impl.dart';
import 'package:flutter_boilerplate/service/user_data_manager.dart';
import 'package:get_it/get_it.dart';

import '../data/datasource/remote/user/user_remote_datasource.dart';
import '../data/repository/user/user_repository.dart';
import '../data/repository/user/user_repository_impl.dart';

class DependencyManager {
  bool _isInitialized = false;

  void initialize() {
    assert(
      !_isInitialized,
      '''
        This class is only invoked on the first run of the app.
        Do not call this multiple times.
        ${StackTrace.current}
        ''',
    );
    final dio = GetIt.I.registerSingleton(Dio());
    GetIt.I
        .registerFactory<UserDatasource>(() => UserRemoteDatasourceImpl(dio));
    GetIt.I.registerFactory<UserRepository>(
      () => UserRepositoryImpl(
        GetIt.I.get<UserDatasource>(),
      ),
    );
    GetIt.I.registerLazySingleton(() => UserDataManager());
    _isInitialized = true;
  }
}
