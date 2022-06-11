import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_repository.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/sign_up_state.dart';

class AuthFormController extends StateNotifier<SignUpState> {
  AuthFormController({required this.authRepository}) : super(SignUpState());
  final HttpAuthRepository authRepository;

  Future<bool> signUpWithEmailAndPassword({
    required Map formData,
  }) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => _signUpWithEmailAndPassword(
        formData: formData,
      ),
    );

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _signUpWithEmailAndPassword({
    required Map formData,
  }) async {
    await authRepository.signUpWithEmailAndPassword(
      firstName: formData['firstName'],
      lastName: formData['lastName'],
      email: formData['email'],
      password: formData['password'],
      confirmPassword: formData['confirmPassword'],
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

  Future<bool> verifyAccountResend({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => _verifyAccountResend(
        email: email,
        password: password,
      ),
    );

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _verifyAccountResend({
    required String email,
    required String password,
  }) async {
    await authRepository.verifyAccountResend(
      email: email,
      password: password,
    );
  }

  Future<bool> signInWithEmailAndPassword({
    required Map formData,
  }) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => _signInWithEmailAndPassword(
        formData: formData,
      ),
    );

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _signInWithEmailAndPassword({
    required Map formData,
  }) async {
    await authRepository.signInWithEmailAndPassword(
      email: formData['email'],
      password: formData['password'],
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
    StateNotifierProvider<AuthFormController, SignUpState>((ref) {
  // StateNotifierProvider.autoDispose<AuthFormController, SignUpState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthFormController(authRepository: authRepository);
});
