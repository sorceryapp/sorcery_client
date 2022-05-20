import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/user.dart';

class AuthDatabase {
  AuthDatabase();

  Future<void> saveUser({required User user}) async {
    final isar = await _openIsar();
    await isar.writeTxn((isar) async {
      user.id = await isar.users.put(user);
    });
  }

  Future<Isar> _openIsar() async {
    final dir = await getApplicationSupportDirectory();

    return await Isar.open(
      schemas: [UserSchema],
      directory: dir.path,
    );
  }
}
