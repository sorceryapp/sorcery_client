import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_api.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/hive_auth_database.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/hive_user.dart';
import 'package:sorcery_desktop_v3/src/shared/data/secure_storage.dart';
import 'package:sorcery_desktop_v3/src/utils/in_memory_store.dart';

class SignUpError implements Exception {
  SignUpError([this.message = 'Signup error: an unknown exception occured.']);
  final String message;

  factory SignUpError.fromCode({required int code}) {
    switch (code) {
      case 422:
        return SignUpError(
            'There was an error creating your account: Unprocessable Entity (422)');
      default:
        return SignUpError();
    }
  }
}

class VerifyAccountError implements Exception {
  VerifyAccountError(
      [this.message =
          'Unable to verify account: an unknown exception occurred.']);
  final String message;

  factory VerifyAccountError.fromCode({required int code}) {
    switch (code) {
      case 401:
        return VerifyAccountError(
            'Unable to verify account: Unauthorized (401)');
      default:
        return VerifyAccountError();
    }
  }
}

class VerifyAccountResendError implements Exception {
  VerifyAccountResendError(
      [this.message =
          'Unable to verify account: an unknown exception occurred.']);
  final String message;

  factory VerifyAccountResendError.fromCode({required int code}) {
    switch (code) {
      case 400:
        return VerifyAccountResendError(
            'An email has recently been sent to you with a link to verify your account. Please wait 30 seconds before trying again: Bad Request (400)');
      case 401:
        return VerifyAccountResendError(
            'Unable to resend verify account email: Unauthorized (401)');
      default:
        return VerifyAccountResendError();
    }
  }
}

class SignInError implements Exception {
  SignInError([this.message = 'Signin error: an unknown exception occured.']);
  final String message;

  factory SignInError.fromCode({required int code}) {
    switch (code) {
      default:
        return SignInError();
    }
  }
}

class LogoutError implements Exception {
  LogoutError([this.message = 'Logout error: an unknown exception occured.']);
  final String message;

  factory LogoutError.fromCode({required int code}) {
    switch (code) {
      case 400:
        return LogoutError('Unable to logout: Bad Request (400)');
      default:
        return LogoutError();
    }
  }
}

abstract class AuthRepository {
  Stream<HiveUser?> authStateChanges();
  Future<void> signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<void> verifyAccount({required String token});
  Future<void> verifyAccountResend(
      {required String email, required String password});
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> logout();
  HiveUser? get currentUser;
}

class HttpAuthRepository implements AuthRepository {
  HttpAuthRepository({AuthApi? authApi}) : _authApi = authApi ?? AuthApi();
  final AuthApi _authApi;

  final _authState = InMemoryStore<HiveUser?>(null);

  @override
  Stream<HiveUser?> authStateChanges() => _authState.stream;

  @override
  HiveUser? get currentUser => _authState.value;

  void dispose() => _authState.close();

  @override
  Future<void> signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await _authApi.signUpWithEmailAndPassword(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    int? statusCode = _getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          await _handleSuccess(response: response);
          break;
        case 422:
          throw SignUpError.fromCode(code: statusCode);
        default:
          throw SignUpError();
      }
    } else {
      throw SignUpError();
    }
  }

  @override
  Future<void> verifyAccount({required String token}) async {
    final jwt = await _getJwt();
    final response = await _authApi.verifyAccount(token: token, jwt: jwt);
    int? statusCode = _getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          await _handleSuccess(response: response);
          break;
        case 401:
          throw VerifyAccountError.fromCode(code: statusCode);
        default:
          throw VerifyAccountError();
      }
    } else {
      throw VerifyAccountError();
    }
  }

  @override
  Future<void> verifyAccountResend(
      {required String email, required String password}) async {
    final response =
        await _authApi.verifyAccountResend(email: email, password: password);
    int? statusCode = _getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          await _handleVerifyAccountResendSuccess(response: response);
          break;
        case 400:
          throw VerifyAccountResendError.fromCode(code: statusCode);
        case 401:
          throw VerifyAccountResendError.fromCode(code: statusCode);
        default:
          throw VerifyAccountResendError();
      }
    } else {
      throw VerifyAccountResendError();
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final response = await _authApi.signInWithEmailAndPassword(
        email: email, password: password);
    int? statusCode = _getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          await _handleSuccess(response: response);
          break;
        default:
          throw SignUpError();
      }
    } else {
      throw SignInError();
    }
  }

  @override
  Future<void> logout() async {
    final response = await _authApi.logout();
    int? statusCode = _getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          await _handleLogoutSuccess();
          break;
        case 400:
          throw LogoutError.fromCode(code: statusCode);
        default:
          throw LogoutError();
      }
    } else {
      throw LogoutError();
    }
  }

  Future<void> _handleSuccess({required response}) async {
    await _setJwt(jwt: response.headers['authorization'].toString());
    final payload = await _getJwtPayload();
    final user = _createHiveUser(payload: payload);
    _setUser(user: user);

    try {
      await _saveUser(user: user);
    } catch (e) {
      print('save user error: $e');
    }
  }

  Future<void> _handleVerifyAccountResendSuccess({required response}) async {
    await _setJwt(jwt: response.headers['authorization'].toString());
  }

  Future<void> _handleLogoutSuccess() async {
    await _deleteJwt();
    _unsetUser();
  }

  int? _getHttpStatusCode({required response}) {
    if (response is Response<dynamic>) {
      return response.statusCode;
    } else if (response is int) {
      return response;
    }

    return null;
  }

  Future<void> _setJwt({required String jwt}) async {
    try {
      await SecureStorage().setJwt(jwt);
    } catch (e) {
      print('Error in _setJwt: $e');
    }
  }

  Future<String?> _getJwt() async {
    try {
      return await SecureStorage().getJwt();
    } catch (e) {
      print('Error in _getJwt: $e');
      return null;
    }
  }

  Future<void> _deleteJwt() async {
    try {
      await SecureStorage().deleteJwt();
    } catch (e) {
      print('Error in _deleteJwt: $e');
    }
  }

  Future<Map<String, dynamic>> _getJwtPayload() async {
    return await SecureStorage().getJwtPayload();
  }

  HiveUser _createHiveUser({required payload}) {
    final userData = payload['data']['user'];

    return HiveUser(
      accountId: userData['id'],
      email: userData['login'].toString(),
      firstName: userData['first_name'].toString(),
      lastName: userData['last_name'].toString(),
      status: userData['status'].toString(),
    );
  }

  void _setUser({required user}) {
    _authState.value = user;
  }

  Future<void> _saveUser({required HiveUser user}) async {
    final authDatabase = HiveUserDB();
    await authDatabase.saveUser(user: user);
  }

  // Future<void> _getUser({required int accountId}) async {
  //   final authDatabase = HiveUserDB();
  //   await authDatabase.getUser(accountId: accountId);
  // }

  void _unsetUser() {
    _authState.value = null;
  }
}

final authRepositoryProvider = Provider<HttpAuthRepository>((ref) {
  final authRepository = HttpAuthRepository();
  ref.onDispose(() => authRepository.dispose());
  return authRepository;
});

final authStateChangesProvider = StreamProvider.autoDispose<HiveUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
