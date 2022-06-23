import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_client.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_errors.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/user_db.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/user.dart';
import 'package:sorcery_desktop_v3/src/shared/data/repository.dart';
import 'package:sorcery_desktop_v3/src/shared/data/secure_storage.dart';
import 'package:sorcery_desktop_v3/src/utils/in_memory_store.dart';

abstract class AuthRepository {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<void> signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<void> verifyAccount({required String token});
  Future<void> verifyAccountResend({required String email});
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> logout();
}

class HttpAuthRepository extends SorceryRepository implements AuthRepository {
  HttpAuthRepository({AuthClient? authClient})
      : _authClient = authClient ?? AuthClient();
  final AuthClient _authClient;
  final _authState = InMemoryStore<User?>(null);

  @override
  User? get currentUser => _authState.value;

  @override
  Stream<User?> authStateChanges() => _authState.stream;

  void dispose() => _authState.close();

  @override
  Future<void> signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await _authClient.signUpWithEmailAndPassword(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    int? statusCode = getHttpStatusCode(response: response);

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
    final jwt = await getJwt();
    final response = await _authClient.verifyAccount(token: token, jwt: jwt);
    int? statusCode = getHttpStatusCode(response: response);

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
  Future<void> verifyAccountResend({required String email}) async {
    final response = await _authClient.verifyAccountResend(email: email);
    int? statusCode = getHttpStatusCode(response: response);

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
    final response = await _authClient.signInWithEmailAndPassword(
        email: email, password: password);
    int? statusCode = getHttpStatusCode(response: response);

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
    final response = await _authClient.logout();
    int? statusCode = getHttpStatusCode(response: response);

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
    await setJwt(jwt: response.headers['authorization'].toString());
    final payload = await getJwtPayload();
    final user = _createHiveUser(payload: payload);
    _setUser(user: user);

    try {
      await _saveUser(user: user);
    } catch (e) {
      print('save user error: $e');
    }
  }

  Future<void> _handleVerifyAccountResendSuccess({required response}) async {
    await setJwt(jwt: response.headers['authorization'].toString());
  }

  Future<void> _handleLogoutSuccess() async {
    await deleteJwt();
    _unsetUser();
  }

  Future<Map<String, dynamic>> getJwtPayload() async {
    return await SecureStorage().getJwtPayload();
  }

  User _createHiveUser({required payload}) {
    final userData = payload['data']['user'];

    return User(
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

  Future<void> _saveUser({required User user}) async {
    final authDatabase = UserDb();
    await authDatabase.saveUser(user: user);
  }

  // Future<void> _getUser({required int accountId}) async {
  //   final authDatabase = UserDb();
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

final authStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
