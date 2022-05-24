import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/isar_user.dart';

class IsarUserDB {
  Future<void> saveUser({required IsarUser user}) async {
    final isar = await _openIsar();
    await isar.writeTxn((isar) async {
      user.id = await isar.isarUsers.put(user);
    });
  }

  // Future<void> getUser({required int accountId}) {
  //   // TODO: implement getUser
  //   throw UnimplementedError();
  // }

  Future<Isar> _openIsar() async {
    final dir = await getApplicationSupportDirectory();

    return await Isar.open(
      schemas: [IsarUserSchema],
      directory: dir.path,
    );
  }
}
