import 'package:sorcery_desktop_v3/src/utils/form_builder/form_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/form_builder.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ResetPasswordScreen> createState() => _ResetPasswordScreen();
}

class _ResetPasswordScreen extends ConsumerState<ResetPasswordScreen> {
  final String _formFileName = 'reset_password.yaml';

  @override
  Widget build(BuildContext context) {
    const SizedBox box = SizedBox(height: 40);

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: [
            box,
            Text(
              AppLocalizations.of(context)!.resetPasswordPageTitle,
              style: const TextStyle(fontSize: 20),
            ),
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
