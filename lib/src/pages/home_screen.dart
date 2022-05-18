import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routing/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SizedBox box = SizedBox(height: 20);

    return Scaffold(
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
    );
  }
}
