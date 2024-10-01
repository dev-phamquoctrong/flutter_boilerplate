import 'package:flutter_boilerplate/exception/app_exception.dart';

class DefaultException extends AppException {
  DefaultException(super.exception);

  @override
  String get message => 'Default exception message';
}
