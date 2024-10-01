import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../exception/app_exception.dart';
import '../router/route_helper.dart';

mixin ScreenUtilMixin {
  void showError(BuildContext context, {Object? exception}) {
    assert(exception is AppException, '''
    `exception` is not a subtype of [AppException].
    ''');
    final message = (exception as AppException).message;
    context.push(AppRoute.errorDialog.path, extra: message);
  }
}
