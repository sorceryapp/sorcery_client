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
  Future<void> updateApp({required formData});
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
      name: formData['name'],
      frameworkId: formData['framework'],
      typeId: formData['type'],
      path: formData['path'],
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
  Future<void> updateApp({required formData}) async {
    final response = await _appClient.updateApp(
      appId: formData['appId'],
      name: formData['name'],
      frameworkId: formData['frameworkId'],
      typeId: formData['typeId'],
      path: formData['path'],
      blueprint: formData['blueprint'],
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
      appList.add(App.fromMap(appMap['attributes']));
    }

    // where is the list of apps coming from?
    // where could the apps have come from:
    // they could be local
    // they could have been created on a different machine
    // they could have been created in the cloud
    // they could be apps from another company that the user has been given access to
    //
    // what apps should be stored in the local database?
    // only apps that have been 'opened' => when an app is opened then you set it up, add the root path, scan the code, etc.
    //
    // TODO
    // diff the list from api request with the apps that are local
    // perhaps a new app wasn't pushed to the cloud?
    // perhaps an app was deleted and that wasn't pushed to the cloud?

    // what if a user is offline?
    // just sees the apps that are saved

    // how can you diff deleted apps?
    // how can you tell if an app is new, and not synced with api (so it's not in the get request response), vs an app that was deleted
    // through the cloud or on another computer so it need to be deleted locally?

    return appList;
  }

  App _handleCreateAppSuccess({required response}) {
    // save new app in local storage
    return App.fromMap(response.data['data']['attributes']);
  }
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
