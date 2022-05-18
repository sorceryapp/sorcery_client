import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_repository.dart';

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
    const SizedBox box = SizedBox(height: 20);
    return (user == null
        ? Scaffold(
            appBar: AppBar(title: const Text('Sorcery')),
            body: Center(
              child: Column(children: [
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
              ]),
            ),
          )
        : Scaffold(
            appBar: AppBar(title: const Text('Sorcery')),
            body: Center(
              child: Column(children: [
                box,
                const Text('Welcome to Sorcery'),
                box,
                Text('Hello ${user.firstName}!'),
              ]),
            ),
          ));
  }
}
