import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_builder.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_config.dart';

class RequestVerifyAccountResendScreen extends StatelessWidget {
  const RequestVerifyAccountResendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _RequestVerifyAccountResend();
  }
}

class _RequestVerifyAccountResend extends StatelessWidget {
  const _RequestVerifyAccountResend({Key? key}) : super(key: key);
  final String _formFileName = 'verify_account_resend.yaml';

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
              SorceryLocalizations.current.resendVerifyAccountPageTitle,
              style: const TextStyle(fontSize: 20),
            ),
            box,
            FutureBuilder<Map>(
              future: FormConfig()
                  .getFormConfig(context: context, formFileName: _formFileName),
              builder: (context, AsyncSnapshot<Map> snapshot) {
                if (snapshot.hasData) {
                  return FormBuilder(blueprint: snapshot.data as Map);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
