import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './jwt.dart';

class SecureStorage {
  SecureStorage({FlutterSecureStorage? flutterSecureStorage})
      : _flutterSecureStorage =
            flutterSecureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _flutterSecureStorage;

  Future<String> getJwt() async {
    return await Jwt.getJwt(store: _flutterSecureStorage);
  }

  Future setJwt(String jwt) async {
    await Jwt.setJwt(store: _flutterSecureStorage, jwt: jwt);
  }

  Future<Map<String, dynamic>> getPayload() async {
    return await Jwt.getPayload(store: _flutterSecureStorage);
  }
}
