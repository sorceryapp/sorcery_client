import 'package:hive_flutter/hive_flutter.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/hive_user.dart';

class HiveUserDB {
  Future<void> saveUser({required HiveUser user}) async {
    await _saveUser(user: user);
  }

  Future<void> getUser({required int accountId}) async {
    await _getUser(accountId: accountId);
  }

  Future<void> _saveUser({required user}) async {
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
