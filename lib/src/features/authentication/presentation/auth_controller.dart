import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_repository.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/sign_up_state.dart';

class AuthFormController extends StateNotifier<SignUpState> {
  AuthFormController({required this.authRepository}) : super(SignUpState());
  final HttpAuthRepository authRepository;

  Future<bool> signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => _signUpWithEmailAndPassword(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    await authRepository.signUpWithEmailAndPassword(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  Future<bool> verifyAccount({required String token}) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(() => _verifyAccount(token: token));
    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _verifyAccount({required String token}) async {
    await authRepository.verifyAccount(token: token);
  }

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => _signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<bool> logout() async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => _logout(),
    );

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _logout() async {
    await authRepository.logout();
  }
}

final authControllerProvider =
    // StateNotifierProvider.autoDispose<AuthFormController, SignUpState>((ref) {
    StateNotifierProvider<AuthFormController, SignUpState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthFormController(authRepository: authRepository);
});
