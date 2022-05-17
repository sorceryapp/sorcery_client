import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/authentication/data/auth_api.dart';
import 'package:sorcery_desktop_v3/src/authentication/domain/user.dart';
import 'package:sorcery_desktop_v3/src/utils/in_memory_store.dart';

abstract class AuthRepository {
  Stream<User?> authStateChanges();
  Future<void> signUpWithEmailAndPassword(String firstName, String lastName,
      String email, String password, String passwordConfirm);
  Future<void> signInWithEmailAndPassword(String email, String password);
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
  Future<void> signUpWithEmailAndPassword(
    String firstName,
    String lastName,
    String email,
    String password,
    String passwordConfirm,
  ) async {
    final response = await _authApi.signup(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      passwordConfirm: passwordConfirm,
    );

    if (currentUser == null) {
      _setUser(response: response);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final response = await _authApi.login(email: email, password: password);

    if (currentUser == null) {
      _setUser(response: response);
    }
  }

  @override
  Future<void> signOut() async {
    await _authApi.logout();
    unsetUset();
  }

  void dispose() => _authState.close();

  void _setUser({response}) {
    // TODO parse response and grab the data for the following props
    // Check if user is a new user and needs to be verified
    _authState.value = const User(
      id: 1,
      email: '',
      firstName: '',
      lastName: '',
      isAuthenticated: true,
    );
  }

  void unsetUset() {
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

// // Why use the InMemoryStore class?
// // I thought Riverpod is a memory store itself?
