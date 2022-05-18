import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/authentication/data/auth_repository.dart';
import 'package:sorcery_desktop_v3/src/authentication/presentation/sign_up_state.dart';

class SignUpFormController extends StateNotifier<SignUpState> {
  SignUpFormController({required this.authRepository}) : super(SignUpState());
  final HttpAuthRepository authRepository;

  Future<bool> submit({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => _authenticate(
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

  Future<void> _authenticate({
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
}

final signUpFormControllerProvider =
    // StateNotifierProvider.autoDispose<SignUpFormController, SignUpState>((ref) {
    StateNotifierProvider<SignUpFormController, SignUpState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignUpFormController(authRepository: authRepository);
});
