import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _userStorage = new FlutterSecureStorage();
  static const _KeyUserToken = 'token';

  static Future setUserToken(String token) async {
    try {
      await _userStorage.write(key: _KeyUserToken, value: token);
      // print('token written successfully');
    } catch (e) {
      throw Exception('Error while login in due to ' + e);
    }
  }

  static Future<String> getUserToken() async {
    // print(await _storage.read(key: _KeyUserToken));
    try {
      String token = await _userStorage.read(key: _KeyUserToken);
      return token;
    } catch (e) {
      throw Exception('Something went wrong while reading the cache' + e);
    }
  }

  static Future removeUserToken(String key) async {
    try {
      var removeToken = await _userStorage.delete(key: key);
      return removeToken;
    } catch (e) {
      throw Exception('Something went wrong while clearing the cache' + e);
    }
  }
}
