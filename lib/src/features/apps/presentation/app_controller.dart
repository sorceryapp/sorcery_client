import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/apps/data/app_repository.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/app_state.dart';

class AppController extends StateNotifier<AppState> {
  AppController({required this.appRepository}) : super(AppState());
  final HttpAppRepository appRepository;

  Future<bool> getApps() async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => _getApps(),
    );

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _getApps() async {
    await appRepository.getApps();
  }

  Future<bool> getApp({required Map formData}) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(() => _getApp(formData: formData));
    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _getApp({required Map formData}) async {
    await appRepository.getApp(appId: formData['appId']);
  }

  Future<bool> createApp({
    required Map formData,
  }) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(() => _createApp(formData: formData));

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _createApp({
    required Map formData,
  }) async {
    await appRepository.createApp(
      name: formData['name'],
      languageId: formData['languageId'],
      frameworkId: formData['frameworkId'],
      typeId: formData['typeId'],
      blueprint: formData['blueprint'],
    );
  }

  Future<bool> updateApp({
    required Map formData,
  }) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => _updateApp(
        formData: formData,
      ),
    );

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _updateApp({
    required Map formData,
  }) async {
    await appRepository.updateApp(
      appId: formData['appId'],
      name: formData['name'],
      languageId: formData['languageId'],
      frameworkId: formData['frameworkId'],
      typeId: formData['typeId'],
      blueprint: formData['blueprint'],
    );
  }

  Future<bool> deleteApp({
    required Map formData,
  }) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => _deleteApp(formData: formData),
    );

    state = state.copyWith(value: value);
    return value.hasError == false;
  }

  Future<void> _deleteApp({
    required Map formData,
  }) async {
    await appRepository.deleteApp(appId: formData['appId']);
  }
}

final appControllerProvider =
    StateNotifierProvider<AppController, AppState>((ref) {
  // StateNotifierProvider.autoDispose<AppController, AppState>((ref) {
  final appRepository = ref.watch(appRepositoryProvider);
  return AppController(appRepository: appRepository);
});
