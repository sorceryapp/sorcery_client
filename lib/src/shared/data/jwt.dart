import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Jwt {
  Jwt();

  static Future<String> getJwt({required FlutterSecureStorage store}) async {
    final jwt = await store.read(key: 'jwt');
    return jwt.toString();
  }

  static Future<void> setJwt(
      {required FlutterSecureStorage store, required String jwt}) async {
    await store.write(key: 'jwt', value: jwt);
  }

  static Future<void> deleteJwt({required FlutterSecureStorage store}) async {
    await store.delete(key: 'jwt');
  }

  static Future<Map<String, dynamic>> getJwtPayload(
      {required FlutterSecureStorage store}) async {
    final jwt = await store.read(key: 'jwt');
    return _parseJwt(jwt.toString());
  }

  static Map<String, dynamic> _parseJwt(String jwt) {
    final parts = jwt.split('.');

    if (parts.length != 3) {
      throw Exception('invalid jwt');
    }

    final payload = _decodeBase64(parts[1]);
    final dynamic payloadMap = json.decode(payload);

    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    var output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('illegal base64url string');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
