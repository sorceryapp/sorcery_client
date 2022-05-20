import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/verify_account_form.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _VerifyAccountScreen();
  }
}

class _VerifyAccountScreen extends StatelessWidget {
  const _VerifyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: const [
            VerifyAccountForm(),
          ],
        ),
      ),
    );
  }
}
