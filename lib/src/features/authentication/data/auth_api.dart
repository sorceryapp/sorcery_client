import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sorcery_desktop_v3/src/shared/data/secure_storage.dart';

/// Exception thrown when signup fails.
class Signup implements Exception {}

class AuthApi {
  AuthApi({Dio? httpClient}) : _httpClient = httpClient ?? Dio();
  final Dio _httpClient;
  final _baseUrl = 'http://localhost:3000';

  Future<dynamic> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final url = '$_baseUrl/create-account';
    final data = json.encode({
      'first_name': firstName,
      'last_name': lastName,
      'login': email,
      'password': password,
      'password-confirm': confirmPassword,
    });

    try {
      return await _httpClient.post(
        url,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    final url = '$_baseUrl/login';
    final data = json.encode({'email': email, 'password': password});

    try {
      return await _httpClient.post(
        url,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> logout() async {
    final jwt = SecureStorage().getJwt();
    final url = '$_baseUrl/logout';

    try {
      return await _httpClient.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': jwt,
          },
        ),
      );
    } catch (e) {
      return e;
    }
  }
}
