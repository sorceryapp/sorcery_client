import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/authentication/data/auth_api.dart';
import 'package:sorcery_desktop_v3/src/authentication/domain/user.dart';
import 'package:sorcery_desktop_v3/src/shared/data/secure_storage.dart';
import 'package:sorcery_desktop_v3/src/utils/in_memory_store.dart';

// class SignUpWithEmailAndPasswordFailure implements Exception {
//   SignUpWithEmailAndPasswordFailure(
//       [this.message = 'An unknown exception occurred.']);

//   factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
//     switch (code) {
//       // to-do: add cases
//       case 'The account you tried to create is currently awaiting verification':
//         return SignUpWithEmailAndPasswordFailure(
//             'This account is awaiting verification');
//       default:
//         return SignUpWithEmailAndPasswordFailure();
//     }
//   }

//   final String message;
// }

// class LoginWithEmailAndPasswordFailure implements Exception {
//   LoginWithEmailAndPasswordFailure(
//       [this.message = 'An unknown exception occurred.']);

//   factory LoginWithEmailAndPasswordFailure.fromCode(String code) {
//     switch (code) {
//       // to-do: add cases
//       case 'The account you tried to create is currently awaiting verification':
//         return LoginWithEmailAndPasswordFailure(
//             'This account is awaiting verification');
//       default:
//         return LoginWithEmailAndPasswordFailure();
//     }
//   }

//   final String message;
// }

// class LogOutFailure implements Exception {}

abstract class AuthRepository {
  Stream<User?> authStateChanges();
  Future<void> signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  User? get currentUser;
}

class HttpAuthRepository implements AuthRepository {
  HttpAuthRepository({AuthApi? authApi}) : _authApi = authApi ?? AuthApi();
  final AuthApi _authApi;

  final _authState = InMemoryStore<User?>(null);

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

    if (response.status && response.statusCode == 200 && currentUser == null) {
      final isVerified = response.data['success'] ==
          'An email has been sent to you with a link to verify your account';
      _handleAuthSuccess(response: response, isVerified: isVerified);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final response = await _authApi.login(email: email, password: password);

    if (response.status && response.statusCode == 200 && currentUser == null) {
      final isVerified = response.data['success'] ==
          'An email has been sent to you with a link to verify your account';
      _handleAuthSuccess(response: response, isVerified: isVerified);
    }
  }

  @override
  Future<void> signOut() async {
    await _authApi.logout();
    _unsetUset();
  }

  void dispose() => _authState.close();

  Future<void> _handleAuthSuccess(
      {required response, required isVerified}) async {
    await _setJwt(jwt: response.headers['authorization'].toString());
    final user =
        createUser(payload: await _getPayload(), isVerified: isVerified);
    _setUser(user: user);
  }

  Future _setJwt({required String jwt}) async {
    return await SecureStorage().setJwt(jwt);
  }

  // Future<String> _getJwt() async {
  //   return await SecureStorage().getJwt();
  // }

  Future<Map<String, dynamic>> _getPayload() async {
    return await SecureStorage().getPayload();
  }

  User createUser({required payload, isVerified = true}) {
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
    // Responses from the API
    // On create:
    // {
    // 	"success": "An email has been sent to you with a link to verify your account"
    // }
    // On verify:
    // {
    //   "success": "Your account has been verified"
    // }

    _authState.value = user;
  }

  void _unsetUset() {
    _authState.value = null;
  }
}

final authRepositoryProvider = Provider<HttpAuthRepository>((ref) {
  final auth = HttpAuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  final auth = ref.watch(authRepositoryProvider);
  return auth.authStateChanges();
});
