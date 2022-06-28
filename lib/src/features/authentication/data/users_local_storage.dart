import 'package:hive_flutter/hive_flutter.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/user.dart';

class UsersLocalStorage {
  Future<void> saveUser({required User user}) async {
    await _saveUser(user: user);
  }

  Future<void> _saveUser({required user}) async {
    final box = await Hive.openBox('user');
    final key = '${user.accountId}_user';
    box.put(key, user);
  }
}
