import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sorcery_desktop_v3/src/shared/data/secure_storage.dart';

/// Exception thrown when signup fails.
class Signup implements Exception {}

class AuthApi {
  AuthApi({Dio? httpClient}) : _httpClient = httpClient ?? Dio();

  static const _baseUrl = 'localhost:3000';
  final Dio _httpClient;

  Future<dynamic> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    const url = '$_baseUrl/create-account';
    final data = json.encode({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password-confirm': passwordConfirm,
    });

    try {
      final response = await _httpClient.post(
        url,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response;
    } catch (e) {
      // handle request failure
    }
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    const url = '$_baseUrl/login';
    final data = json.encode({'email': email, 'password': password});

    try {
      final response = await _httpClient.post(
        url,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response;
    } catch (e) {
      // handle request failure
    }
  }

  Future<dynamic> logout() async {
    final jwt = SecureStorage().getJwt();
    const url = '$_baseUrl/logout';

    try {
      final response = await _httpClient.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': jwt,
          },
        ),
      );
      return response;
    } catch (e) {
      // handle request failure
    }
  }
}
