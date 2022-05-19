import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_repository.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/user.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/logout_form.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/verify_account_form.dart';

import '../routing/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    final isAuthenticated = user != null;

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: isAuthenticated
          ? AuthenticatedContent(user: user)
          : const UnauthenticatedContent(),
    );
  }
}

class AuthenticatedContent extends StatelessWidget {
  const AuthenticatedContent({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    const SizedBox box = SizedBox(height: 20);
    final isVerified = user.isVerified;

    return Center(
      child: Column(
        children: [
          box,
          Text('Hello ${user.firstName}!'),
          box,
          (isVerified
              ? Column(
                  children: const [
                    Text("You're Verified!"),
                    LogoutForm(),
                  ],
                )
              : const VerifyAccountForm()),
        ],
      ),
    );
  }
}

class UnauthenticatedContent extends StatelessWidget {
  const UnauthenticatedContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SizedBox box = SizedBox(height: 20);

    return Center(
      child: Column(
        children: [
          box,
          const Text('Welcome to Sorcery'),
          box,
          ElevatedButton(
              onPressed: () => context.goNamed(AppRoute.signIn.name),
              child: const Text('Sign In')),
          box,
          ElevatedButton(
            onPressed: () => context.goNamed(AppRoute.signUp.name),
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
