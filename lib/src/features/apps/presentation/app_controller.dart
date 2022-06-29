import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/apps/data/app_repository.dart';
import 'package:sorcery_desktop_v3/src/features/apps/domain/app.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/app_state.dart';

class AppController extends StateNotifier<AppState> {
  AppController({required this.appRepository}) : super(AppState());
  final HttpAppRepository appRepository;

  Future<List<App>> getApps() async {
    return await appRepository.getApps();
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

  Future<App> createApp({required Map formData}) async {
    return await appRepository.createApp(formData: formData);
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
      formData: formData,
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

final appControllerStateNotifierProvider =
    StateNotifierProvider.autoDispose<AppController, AppState>((ref) {
  final appRepository = ref.watch(appRepositoryProvider);
  return AppController(appRepository: appRepository);
});

final appControllerProvider = Provider<AppController>((ref) {
  AppController appController =
      AppController(appRepository: HttpAppRepository());
  ref.onDispose(() => appController.dispose());
  return appController;
});

final appListFutureProvider = FutureProvider.autoDispose<List<App>>((ref) {
  final appController = ref.watch(appControllerProvider);
  return appController.getApps();
});

final createAppFutureProvider =
    FutureProvider.autoDispose.family<App?, Map>((ref, formData) {
  final appController = ref.watch(appControllerProvider);
  return appController.createApp(formData: formData);
});
