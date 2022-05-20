import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_repository.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/request_verify_resend_screen.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:sorcery_desktop_v3/src/pages/home_screen.dart';

enum AppRoute {
  home,
  signIn,
  signUp,
  requestVerifyResend,
}

final routerProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (state) {
      final isAuthenticated = authRepository.currentUser != null;
      bool isVerified = false;

      if (isAuthenticated && authRepository.currentUser?.status == 'verified') {
        isVerified = true;
      }

      if (isAuthenticated) {
        if (state.location == '/signIn' || state.location == '/signUp') {
          return '/';
        }

        if (isVerified) {
          if (state.location == '/requestVerifyResend') {
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
            path: 'requestVerifyResend',
            name: AppRoute.requestVerifyResend.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const RequestVerifyResendScreen(),
            ),
          ),
        ],
      ),
    ],
  );
});
