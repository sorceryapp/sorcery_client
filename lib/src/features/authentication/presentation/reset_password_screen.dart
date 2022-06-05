import "dart:io";
import 'package:yaml/yaml.dart';

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
  @override
  Widget build(BuildContext context) {
    final file = File(
        'lib/src/features/authentication/presentation/reset_password.yaml');

    final yamlToString = file.readAsStringSync();
    Map blueprint = loadYaml(yamlToString);

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
            FormBuilder(blueprint: blueprint),
          ],
        ),
      ),
    );
  }
}
