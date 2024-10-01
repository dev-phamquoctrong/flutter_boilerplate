import 'package:flutter/services.dart';

class APIEndpoint {
  static const baseUrl =
      appFlavor == 'dev' ? 'https://reqres.in/api' : 'YOUR_PRODUCTION_URL';

  static const String users = '/users';
}
