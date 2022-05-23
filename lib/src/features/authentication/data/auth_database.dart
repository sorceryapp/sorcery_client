import 'package:hive_flutter/hive_flutter.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/user.dart';

class AuthDatabase {
  AuthDatabase();

  Future<void> saveUser({required User user}) async {
    // needs to be done once...
    await Hive.initFlutter();

    // needs to be done once
    Hive.registerAdapter(UserAdapter());

    await _saveUser(user: user);
  }

  Future<void> getUser({required int accountId}) async {
    await _getUser(accountId: accountId);
  }

  Future<void> _saveUser({required User user}) async {
    final box = await Hive.openBox('user');
    final key = '${user.accountId}_user';
    box.put(key, user);
  }

  Future<void> _getUser({required int accountId}) async {
    final box = Hive.box('user');
    final key = '${accountId}_user';
    await box.get(key);
  }
}
