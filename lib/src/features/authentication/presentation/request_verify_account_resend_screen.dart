import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/verify_account_resend_form.dart';

class RequestVerifyAccountResendScreen extends StatelessWidget {
  const RequestVerifyAccountResendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _RequestVerifyAccountResend();
  }
}

class _RequestVerifyAccountResend extends StatelessWidget {
  const _RequestVerifyAccountResend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: const [
            VerifyAccountResendForm(),
          ],
        ),
      ),
    );
  }
}
