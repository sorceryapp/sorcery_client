import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sorcery_desktop_v3/src/shared/data/client.dart';
import 'package:sorcery_desktop_v3/src/shared/data/secure_storage.dart';

class AuthApi extends Client {
  Future<dynamic> getApps() async {
    final jwt = SecureStorage().getJwt();
    final url = '$baseUrl/apps';

    try {
      return await httpClient.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authentication': jwt,
          },
        ),
      );
    } on DioError catch (e) {
      return e.response?.statusCode;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  Future<dynamic> getApp({required String appId}) async {
    final jwt = SecureStorage().getJwt();
    final url = '$baseUrl/apps/$appId';

    try {
      return await httpClient.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authentication': jwt,
          },
        ),
      );
    } on DioError catch (e) {
      return e.response?.statusCode;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  Future<dynamic> createApp({
    required String name,
    required int languageId,
    required int frameworkId,
    required int typeId,
    required Map<dynamic, dynamic> blueprint,
  }) async {
    final jwt = SecureStorage().getJwt();
    final url = '$baseUrl/apps';
    final data = json.encode({
      'name': name,
      'language_id': languageId,
      'framework_id': frameworkId,
      'type_id': typeId,
      'blueprint': blueprint,
    });

    try {
      return await httpClient.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authentication': jwt,
          },
        ),
      );
    } on DioError catch (e) {
      return e.response?.statusCode;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  Future<dynamic> updateApp({
    required String appId,
    required String name,
    required int languageId,
    required int frameworkId,
    required int typeId,
    required Map<dynamic, dynamic> blueprint,
  }) async {
    final jwt = SecureStorage().getJwt();
    final url = '$baseUrl/apps/$appId';
    final data = json.encode({
      'name': name,
      'language_id': languageId,
      'framework_id': frameworkId,
      'type_id': typeId,
      'blueprint': blueprint,
    });

    try {
      return await httpClient.patch(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authentication': jwt,
          },
        ),
      );
    } on DioError catch (e) {
      return e.response?.statusCode;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  Future<dynamic> deleteApp({required String appId}) async {
    final jwt = SecureStorage().getJwt();
    final url = '$baseUrl/apps/$appId';

    try {
      return await httpClient.delete(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authentication': jwt,
          },
        ),
      );
    } on DioError catch (e) {
      return e.response?.statusCode;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }
}
