import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _SignUp();
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SizedBox box = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: [
            box,
            Text(
              SorceryLocalizations.current.signUpPageTitle,
              style: const TextStyle(fontSize: 20),
            ),
            box,
            const SignUpForm(),
          ],
        ),
      ),
    );
  }
}
