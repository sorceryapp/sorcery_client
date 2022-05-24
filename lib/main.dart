import 'dart:async';
// import 'dart:ffi' as ffi; // Need to open libisar.dylib

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sorcery_desktop_v3/src/app.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/hive_user.dart';
import 'package:sorcery_desktop_v3/src/localization/string_hardcoded.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors

  // * Initialize Hive
  await Hive.initFlutter();

  // * Register Hive adapters
  Hive.registerAdapter(HiveUserAdapter());

  await runZonedGuarded(() async {
    // ffi.DynamicLibrary.open(
    //     '/Users/holdenhinkle/Development/flutter/.pub-cache/hosted/pub.dartlang.org/isar_flutter_libs-3.0.0-dev.0/macos/libisar.dylib');

    // * Turn off the # in the URLs on the web
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

    // * Entry point of the app
    runApp(const ProviderScope(child: App()));

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An error occurred'.hardcoded),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}
