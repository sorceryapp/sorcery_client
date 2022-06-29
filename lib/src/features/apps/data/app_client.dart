import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sorcery_desktop_v3/src/shared/data/client.dart';
import 'package:sorcery_desktop_v3/src/shared/data/secure_storage.dart';

class AppClient extends Client {
  Future<dynamic> getApps() async {
    final jwt = SecureStorage().getJwt();
    final url = '$baseUrl/api/v1/apps';

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
    required int frameworkId,
    required int typeId,
    required String path,
    Map<dynamic, dynamic> blueprint = const {},
  }) async {
    final jwt = SecureStorage().getJwt();
    final url = '$baseUrl/api/v1/apps';
    final data = json.encode({
      'name': name,
      'framework_id': frameworkId,
      'type_id': typeId,
      'path': path,
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
    required int frameworkId,
    required int typeId,
    required String path,
    required Map<dynamic, dynamic> blueprint,
  }) async {
    final jwt = SecureStorage().getJwt();
    final url = '$baseUrl/apps/$appId';
    final data = json.encode({
      'name': name,
      'framework_id': frameworkId,
      'type_id': typeId,
      'path': path,
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
