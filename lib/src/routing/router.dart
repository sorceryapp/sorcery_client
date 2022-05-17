import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/authentication/presentation/sign_in_screen.dart';
import 'package:sorcery_desktop_v3/src/authentication/presentation/sign_up_screen.dart';
import 'package:sorcery_desktop_v3/src/marketing_pages/home_screen.dart';

enum AppRoute {
  home,
  signIn,
  signUp,
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
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
        ],
      ),
    ],
  );
});
