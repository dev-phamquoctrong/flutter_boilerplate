import 'package:flutter_boilerplate/exception/app_exception.dart';

class InternetException extends AppException {
  InternetException(super.dioException);

  @override
  String get message => 'Internet has an error';
}
