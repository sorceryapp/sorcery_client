import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/user.dart';

class UsersLocalStorage {
  static Future<UsersLocalStorage> getInstance() async {
    final Isar isar = await _openIsar();
    return UsersLocalStorage(isar);
  }

  Isar isar;
  UsersLocalStorage(this.isar);

  Future<void> saveUser({required User user}) async {
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }

  Future<bool> closeIsar() async {
    return await isar.close();
  }

  static Future<Isar> _openIsar() async {
    final dir = await getApplicationSupportDirectory();

    return await Isar.open(
      [UserSchema],
      directory: dir.path,
    );
  }
}
