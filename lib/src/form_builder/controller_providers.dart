import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/app_controller.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/app_state.dart';
// import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_controller.dart';
import 'package:sorcery_desktop_v3/src/utils/async_value_ui.dart';

class ControllerProviders {
  final String _providerName;
  ControllerProviders({required providerName}) : _providerName = providerName;

  AutoDisposeStateNotifierProvider<AppController, AppState> getProvider() {
    // StateNotifierProvider<dynamic, dynamic> getProvider() {
    switch (_providerName) {
      // case 'authControllerStateNotifierProvider':
      //   return authControllerStateNotifierProvider;
      case 'appControllerStateNotifierProvider':
        return appControllerStateNotifierProvider;
    }

    throw ('Error in ControllerProviders#getProvider');
  }

  getAction({required WidgetRef ref, required String controllerAction}) {
    switch (controllerAction) {
      // case 'signUpWithEmailAndPassword':
      //   return ref.read(getProvider().notifier).signUpWithEmailAndPassword;
      // case 'signInWithEmailAndPassword':
      //   return ref.read(getProvider().notifier).signInWithEmailAndPassword;
      // case 'verifyAccount':
      //   return ref.read(getProvider().notifier).verifyAccount;
      // case 'verifyAccountResend':
      //   return ref.read(getProvider().notifier).verifyAccountResend;
      case 'createApp':
        return ref.watch(getProvider().notifier).createApp;
    }

    throw ('Error in ControllerProviders#getAction');
  }

  void handleErrors({required BuildContext context, required WidgetRef ref}) {
    switch (_providerName) {
      case 'authControllerStateNotifierProvider':
        ref.listen<AsyncValue>(
          getProvider().select((state) => state.value),
          (_, state) => state.showAlertDialogOnError(context),
        );
        break;
      case 'appControllerStateNotifierProvider':
        ref.listen<AsyncValue>(
          getProvider().select((state) => state.value),
          (_, state) => state.showAlertDialogOnError(context),
        );
        break;
      default:
        throw ('Error in ControllerProviders#handleErrors');
    }
  }
}
