import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routing/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Column(children: [
        const Text('Welcome to Sorcery'),
        ElevatedButton(
            onPressed: () => context.goNamed(AppRoute.signIn.name),
            child: const Text('Sign In')),
        ElevatedButton(
          onPressed: () => context.goNamed(AppRoute.signUp.name),
          child: const Text('Sign Up'),
        ),
      ]),
    );
  }
}
