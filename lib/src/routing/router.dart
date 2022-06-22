import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/apps_create_screen.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/apps_show_screen.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/apps_update_screen.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/apps_screen.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_repository.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/verify_account_resend_screen.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/reset_password_screen.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/verify_account_screen.dart';
import 'package:sorcery_desktop_v3/src/pages/home_screen.dart';

enum AppRoute {
  home,
  signIn,
  signUp,
  verifyAccount,
  requestVerifyAccountResend,
  resetPassword,
  apps,
  appsShow,
  appsCreate,
  appsUpdate,
  appsDelete,
}

final routerProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (state) {
      final bool isAuthenticated = authRepository.currentUser != null;
      final bool isVerified =
          isAuthenticated && authRepository.currentUser?.status == 'verified';

      if (isAuthenticated) {
        if (state.location == '/signIn' || state.location == '/signUp') {
          return '/';
        }

        if (isVerified) {
          if (state.location == '/verifyAccount' ||
              state.location == '/requestVerifyAccountResend') {
            return '/';
          }
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'signIn',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const SignInScreen(),
            ),
          ),
          GoRoute(
            path: 'signUp',
            name: AppRoute.signUp.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const SignUpScreen(),
            ),
          ),
          GoRoute(
            path: 'verifyAccount',
            name: AppRoute.verifyAccount.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const VerifyAccountScreen(),
            ),
          ),
          GoRoute(
            path: 'requestVerifyAccountResend',
            name: AppRoute.requestVerifyAccountResend.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const RequestVerifyAccountResendScreen(),
            ),
          ),
          GoRoute(
            path: 'resetPassword',
            name: AppRoute.resetPassword.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const ResetPasswordScreen(),
            ),
          ),
          GoRoute(
            path: 'apps',
            name: AppRoute.apps.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const AppsScreen(),
            ),
          ),
          GoRoute(
            path: 'apps/:a_id',
            name: AppRoute.appsShow.name,
            builder: (context, state) {
              final appId = state.params['a_id']!;
              return AppsShowScreen(appId: appId);
            },
            routes: [
              GoRoute(
                path: 'update',
                name: AppRoute.appsUpdate.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  fullscreenDialog: true,
                  child: const AppsUpdateScreen(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: 'appsCreate',
            name: AppRoute.appsCreate.name,
            builder: (context, state) => const AppsCreateScreen(),
            // pageBuilder: (context, state) => MaterialPage(
            //   key: state.pageKey,
            //   fullscreenDialog: true,
            //   child: const AppsCreateScreen(),
            // ),
          ),
        ],
      ),
    ],
  );
});
