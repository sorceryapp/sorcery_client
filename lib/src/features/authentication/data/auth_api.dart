import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sorcery_desktop_v3/src/shared/data/secure_storage.dart';

class AuthApi {
  AuthApi({Dio? httpClient}) : _httpClient = httpClient ?? Dio();
  final Dio _httpClient;
  final _baseUrl = 'http://localhost:3000';

  Future<dynamic> signUpWithEmailAndPassword({
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
    } on DioError catch (e) {
      return e.response?.statusCode;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  Future<dynamic> verifyAccount({required String token, String? jwt}) async {
    final url = '$_baseUrl/verify-account?key=$token';
    final headers = jwt != null
        ? {'Content-Type': 'application/json', 'Authentication': jwt}
        : {'Content-Type': 'application/json'};

    try {
      return await _httpClient.post(
        url,
        options: Options(
          headers: headers,
        ),
      );
    } on DioError catch (e) {
      return e.response?.statusCode;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  Future<dynamic> verifyAccountResend(
      {required String email, required String password}) async {
    final url = '$_baseUrl/verify-account-resend';
    final data = json.encode({'login': email, 'password': password});

    try {
      return await _httpClient.post(
        url,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
    } on DioError catch (e) {
      return e.response?.statusCode;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  Future<dynamic> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final url = '$_baseUrl/login';
    final data = json.encode({'login': email, 'password': password});

    try {
      return await _httpClient.post(
        url,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
    } on DioError catch (e) {
      return e.response?.statusCode;
    } catch (e) {
      print('Error: $e');
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
