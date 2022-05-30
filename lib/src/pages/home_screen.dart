import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_repository.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/domain/user.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/logout_form.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final isVerified = user.status == 'verified';

    return Center(
      child: Column(
        children: [
          box,
          Text(
            '${AppLocalizations.of(context)!.homePageTitleAuthenticated} ${user.firstName}!',
            style: const TextStyle(fontSize: 20),
          ),
          box,
          if (!isVerified)
            Link(
              uri: Uri.parse('/verifyAccount'),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: Text(
                  AppLocalizations.of(context)!.verifyAccountTextLink,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          if (isVerified)
            Link(
              uri: Uri.parse('/resetPassword'),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: const Text(
                  'Reset password',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          const LogoutForm(),
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
          Text(
            '${AppLocalizations.of(context)!.homePageTitleUnauthenticated} Sorcery',
            style: const TextStyle(fontSize: 20),
          ),
          box,
          ElevatedButton(
            onPressed: () => context.goNamed(AppRoute.signIn.name),
            child: Text(AppLocalizations.of(context)!.accountButtonSignIn),
          ),
          box,
          ElevatedButton(
            onPressed: () => context.goNamed(AppRoute.signUp.name),
            child: Text(AppLocalizations.of(context)!.accountButtonSignUp),
          ),
        ],
      ),
    );
  }
}
