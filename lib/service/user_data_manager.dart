import 'package:shared_preferences/shared_preferences.dart';

class UserDataManager {
  // Key for local storage
  final _accessToken = 'accessToken';

  Future<void> setAccessToken(String token) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString(_accessToken, token);
  }

  Future<String?> getAccessToken() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString(_accessToken);
  }
}
