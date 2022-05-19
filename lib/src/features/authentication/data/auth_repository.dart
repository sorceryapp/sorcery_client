import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_api.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/user.dart';
import 'package:sorcery_desktop_v3/src/shared/data/secure_storage.dart';
import 'package:sorcery_desktop_v3/src/utils/in_memory_store.dart';

class SignUpError implements Exception {
  SignUpError([this.message = 'Signup error: an unknown exception occured.']);
  final String message;

  factory SignUpError.fromCode({required int code}) {
    switch (code) {
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
        return VerifyAccountError('Unable to verify account: unauthorized');
      default:
        return VerifyAccountError();
    }
  }
}

abstract class AuthRepository {
  Stream<User?> authStateChanges();
  Future<void> signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<void> verifyAccount({required String token});
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  User? get currentUser;
}

class HttpAuthRepository implements AuthRepository {
  HttpAuthRepository({AuthApi? authApi}) : _authApi = authApi ?? AuthApi();
  final AuthApi _authApi;

  final _authState = InMemoryStore<User?>(null);

  void dispose() => _authState.close();

  @override
  Stream<User?> authStateChanges() => _authState.stream;

  @override
  User? get currentUser => _authState.value;

  @override
  Future<void> signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await _authApi.signup(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    switch (response.statusCode) {
      case 200:
        _handleSignUpSuccess(response: response);
        break;
      default:
        SignUpError();
    }
  }

  @override
  Future<void> verifyAccount({required String token}) async {
    final jwt = await _getJwt();
    final response = await _authApi.verify(token: token, jwt: jwt);
    int? statusCode = _getStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          _handleVerifySuccess(response: response);
          break;
        case 401:
          throw VerifyAccountError.fromCode(code: 401);
        default:
          throw VerifyAccountError();
      }
    } else {
      throw VerifyAccountError();
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final response = await _authApi.login(email: email, password: password);

    switch (response.statusCode) {
      case 200:
        _handleSignInSuccess(response: response);
        break;
      default:
        SignUpError();
    }
  }

  @override
  Future<void> signOut() async {
    await _authApi.logout();
    _unsetUser();
    // delete jwt??
  }

  Future<void> _handleSignUpSuccess({required response}) async {
    await _setJwt(jwt: response.headers['authorization'].toString());
    final payload = await _getJwtPayload();
    final user = _createUser(payload: payload, isVerified: false);
    _setUser(user: user);
  }

  Future<void> _handleSignInSuccess({required response}) async {
    await _setJwt(jwt: response.headers['authorization'].toString());
    final payload = await _getJwtPayload();
    final user = _createUser(payload: payload);
    _setUser(user: user);
  }

  Future<void> _handleVerifySuccess({required response}) async {
    await _setJwt(jwt: response.headers['authorization'].toString());
    final payload = await _getJwtPayload();
    final user = _createUser(payload: payload);
    _setUser(user: user);

    // TODO Determine if the following checks are needed
    // if (payload['data']['authenticated_by'] == 'autologin' &&
    //     payload['data']['autologin_type'] == 'verify_account') {
    //   final user = _createUser(payload: payload);
    //   _setUser(user: user);
    // }
  }

  int? _getStatusCode({required response}) {
    if (response is Response<dynamic>) {
      return response.statusCode;
    } else if (response is int) {
      return response;
    }

    return null;
  }

  Future _setJwt({required String jwt}) async {
    return await SecureStorage().setJwt(jwt);
  }

  Future<String?> _getJwt() async {
    try {
      return await SecureStorage().getJwt();
    } catch (e) {
      print('GET_JWT ERROR: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>> _getJwtPayload() async {
    return await SecureStorage().getJwtPayload();
  }

  User _createUser({required payload, isVerified = true}) {
    final id = payload['data']['account_id'];
    final userData = payload['data']['user'];

    return User(
      id: id,
      email: userData['login'].toString(),
      firstName: userData['first_name'].toString(),
      lastName: userData['last_name'].toString(),
      isVerified: isVerified,
    );
  }

  void _setUser({required user}) {
    _authState.value = user;
  }

  void _unsetUser() {
    _authState.value = null;
  }
}

final authRepositoryProvider = Provider<HttpAuthRepository>((ref) {
  final authRepository = HttpAuthRepository();
  ref.onDispose(() => authRepository.dispose());
  return authRepository;
});

final authStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
