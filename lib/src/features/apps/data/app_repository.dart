import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/apps/data/app_client.dart';
import 'package:sorcery_desktop_v3/src/features/apps/data/app_errors.dart';
import 'package:sorcery_desktop_v3/src/features/apps/domain/app.dart';
import 'package:sorcery_desktop_v3/src/shared/data/repository.dart';
import 'package:sorcery_desktop_v3/src/utils/in_memory_store.dart';

abstract class AppRepository {
  // App? get currentApp;
  // Stream<App?> appStateChanges();
  Future<List<App?>?> getApps();
  Future<void> getApp({required String appId});
  Future<App> createApp({required formData});
  Future<void> updateApp({
    required String appId,
    required String name,
    required int languageId,
    required int frameworkId,
    required int typeId,
    required Map<dynamic, dynamic> blueprint,
  });
  Future<void> deleteApp({required String appId});
}

class HttpAppRepository extends SorceryRepository implements AppRepository {
  HttpAppRepository({AppClient? appClient})
      : _appClient = appClient ?? AppClient();
  final AppClient _appClient;
  final _appState = InMemoryStore<App?>(null);

  // @override
  // App? get currentApp => _appState.value;

  // @override
  // Stream<App?> appStateChanges() => _appState.stream;

  void dispose() => _appState.close();

  @override
  Future<List<App>> getApps() async {
    final response = await _appClient.getApps();
    int? statusCode = getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          return _handleGetAppsSuccess(response: response);
        default:
          throw GetAppsError();
      }
    }

    throw GetAppsError();
  }

  @override
  Future<void> getApp({required String appId}) async {
    final response = await _appClient.getApp(appId: appId);
    int? statusCode = getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          await _handleSuccess(response: response);
          break;
        default:
          throw GetAppError();
      }
    } else {
      throw GetAppError();
    }
  }

  @override
  Future<App> createApp({required formData}) async {
    final response = await _appClient.createApp(
      name: 'Berry Winkle',
      languageId: 1,
      frameworkId: 1,
      typeId: 1,
      // name: formData['name'],
      // languageId: formData['languageId'],
      // frameworkId: formData['frameworkId'],
      // typeId: formData['typeId'],
      // blueprint: formData['blueprint'],
    );
    int? statusCode = getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          return _handleCreateAppSuccess(response: response);
        default:
          throw CreateAppError();
      }
    } else {
      throw CreateAppError();
    }
  }

  @override
  Future<void> updateApp(
      {required String appId,
      required String name,
      required int languageId,
      required int frameworkId,
      required int typeId,
      required Map blueprint}) async {
    final response = await _appClient.updateApp(
      appId: appId,
      name: name,
      languageId: languageId,
      frameworkId: frameworkId,
      typeId: typeId,
      blueprint: blueprint,
    );
    int? statusCode = getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          await _handleSuccess(response: response);
          break;
        default:
          throw UpdateAppError();
      }
    } else {
      throw UpdateAppError();
    }
  }

  @override
  Future<void> deleteApp({required String appId}) async {
    final response = await _appClient.deleteApp(appId: appId);
    int? statusCode = getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          await _handleSuccess(response: response);
          break;
        default:
          throw DeleteAppError();
      }
    } else {
      throw DeleteAppError();
    }
  }

  Future<void> _handleSuccess({required response}) async {}

  List<App> _handleGetAppsSuccess({required response}) {
    List<App> appList = [];

    for (final appMap in response.data['data']) {
      // appList.add(App.fromMap(_updateIdKey(appMap: appMap['attributes'])));
      appList.add(App.fromMap(appMap['attributes']));
    }

    return appList;
  }

  App _handleCreateAppSuccess({required response}) {
    // save new app in local storage
    return App.fromMap(response.data['data']['attributes']);

    // return App.fromMap(_updateIdKey(appMap: response.data['data']['attributes']));
  }

//   Map<String, dynamic> _updateIdKey({required appMap}) {
//     Map<String, dynamic> updatedAppMap = {};

//     appMap.forEach((k, v) {
//       if (k == 'id') {
//         updatedAppMap['appId'] = v;
//       } else {
//         updatedAppMap[k] = v;
//       }
//     });

//     return updatedAppMap;
//   }
}

final appRepositoryProvider = Provider<HttpAppRepository>((ref) {
  HttpAppRepository appRepository = HttpAppRepository();
  ref.onDispose(() => appRepository.dispose());
  return appRepository;
});

// final appStateChangesProvider = StreamProvider.autoDispose<App?>((ref) {
//   final appRepository = ref.watch(appRepositoryProvider);
//   return appRepository.appStateChanges();
// });
