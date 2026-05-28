import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static const _key = 'user_id_session';

  final SharedPreferences _prefs;

  UserStorage(this._prefs); 
  // get el id 
  String? getUserId() => _prefs.getString(_key);

  Future<void> saveUserId(String userId) => _prefs.setString(_key, userId);

  Future<void> clearSession() => _prefs.remove(_key);

  bool get hasSession => getUserId() != null;
}