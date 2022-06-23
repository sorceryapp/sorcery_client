import 'package:sorcery_desktop_v3/src/features/apps/data/app_client.dart';
import 'package:sorcery_desktop_v3/src/features/apps/data/app_errors.dart';
import 'package:sorcery_desktop_v3/src/features/apps/domain/app.dart';
import 'package:sorcery_desktop_v3/src/shared/data/repository.dart';
import 'package:sorcery_desktop_v3/src/utils/in_memory_store.dart';

abstract class AppRepository {
  App? get currentApp;
  Stream<App?> appStateChanges();
  Future<void> getApps();
  Future<void> getApp({required String appId});
  Future<void> createApp({
    required String name,
    required int languageId,
    required int frameworkId,
    required int typeId,
    required Map<dynamic, dynamic> blueprint,
  });
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

  @override
  App? get currentApp => _appState.value;

  @override
  Stream<App?> appStateChanges() => _appState.stream;

  void dispose() => _appState.close();

  @override
  Future<void> getApps() async {
    final response = await _appClient.getApps();
    int? statusCode = getHttpStatusCode(response: response);

    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          await _handleSuccess(response: response);
          break;
        default:
          throw GetAppsError();
      }
    } else {
      throw GetAppsError();
    }
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
  Future<void> createApp(
      {required String name,
      required int languageId,
      required int frameworkId,
      required int typeId,
      required Map blueprint}) async {
    final response = await _appClient.createApp(
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
}
