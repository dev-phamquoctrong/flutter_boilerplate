import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../exception/app_exception.dart';
import '../router/app_route.dart';

mixin ModalMixin {
  void showError(BuildContext context, {Object? exception}) {
    assert(exception is AppException, '''
    `exception` is not a subtype of [AppException].
    ''');
    final message = (exception as AppException).message;
    context.push(AppRoute.errorDialog.path, extra: message);
  }

  Future<Object?> openDialog(
    BuildContext context, {
    required AppRoute dialogRoute,
    Object? argument,
  }) {
    return context.push(dialogRoute.path, extra: argument);
  }

  Future<Object?> openBottomSheet(
    BuildContext context, {
    required AppRoute bottomSheetRoute,
    Object? argument,
  }) {
    return context.push(bottomSheetRoute.path, extra: argument);
  }

  void closeModal(BuildContext context, {Object? result}) {
    context.pop(result);
  }
}
