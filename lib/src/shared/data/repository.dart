import 'package:dio/dio.dart';
import 'package:sorcery_desktop_v3/src/shared/data/secure_storage.dart';

class SorceryRepository {
  int? getHttpStatusCode({required response}) {
    if (response is Response<dynamic>) {
      return response.statusCode;
    } else if (response is int) {
      return response;
    }

    return null;
  }

  Future<void> setJwt({required String jwt}) async {
    try {
      await SecureStorage().setJwt(jwt);
    } catch (e) {
      print('Error in setJwt: $e');
    }
  }

  Future<String?> getJwt() async {
    try {
      return await SecureStorage().getJwt();
    } catch (e) {
      print('Error in getJwt: $e');
      return null;
    }
  }

  Future<void> deleteJwt() async {
    try {
      await SecureStorage().deleteJwt();
    } catch (e) {
      print('Error in deleteJwt: $e');
    }
  }
}
