import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/sign_up_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              AppLocalizations.of(context)!.signUpPageTitle,
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
