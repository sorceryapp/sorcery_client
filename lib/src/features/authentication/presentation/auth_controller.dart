import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_repository.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_state.dart';

class AuthFormController extends StateNotifier<AuthState> {
  AuthFormController({required this.authRepository}) : super(AuthState());
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

  Future<bool> verifyAccount({required Map formData}) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value =
        await AsyncValue.guard(() => _verifyAccount(formData: formData));
    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _verifyAccount({required Map formData}) async {
    await authRepository.verifyAccount(token: formData['token']);
  }

  Future<bool> verifyAccountResend({
    required Map formData,
  }) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value =
        await AsyncValue.guard(() => _verifyAccountResend(formData: formData));

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _verifyAccountResend({
    required Map formData,
  }) async {
    await authRepository.verifyAccountResend(email: formData['email']);
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

final authControllerStateNotifierProvider =
    StateNotifierProvider<AuthFormController, AuthState>((ref) {
  // StateNotifierProvider.autoDispose<AuthFormController, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthFormController(authRepository: authRepository);
});
