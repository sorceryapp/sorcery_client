import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/verify_account_resend_form.dart';

class RequestVerifyResendScreen extends StatelessWidget {
  const RequestVerifyResendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _RequestVerifyResend();
  }
}

class _RequestVerifyResend extends StatelessWidget {
  const _RequestVerifyResend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SizedBox box = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: const [
            box,
            Text('Resend Verify Account Email'),
            box,
            VerifyAccountResendForm(),
          ],
        ),
      ),
    );
  }
}
