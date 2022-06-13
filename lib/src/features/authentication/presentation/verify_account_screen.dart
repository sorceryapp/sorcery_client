import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_repository.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_builder.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_config.dart';

class VerifyAccountScreen extends ConsumerStatefulWidget {
  const VerifyAccountScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<VerifyAccountScreen> createState() => _VerifyAccountScreen();
}

class _VerifyAccountScreen extends ConsumerState<VerifyAccountScreen> {
  final String _directoryName = 'authentication';
  final String _formFileName = 'verify_account.yaml';

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateChangesProvider).value;
    final firstName =
        '${user?.firstName[0].toUpperCase()}${user?.firstName.substring(1).toLowerCase()}';
    const SizedBox box = SizedBox(height: 40);

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: [
            box,
            Text(
              '$firstName, ${SorceryLocalizations.current.verifyAccountPageTitle}',
              style: const TextStyle(fontSize: 20),
            ),
            box,
            FutureBuilder<Map>(
              future: FormConfig().getFormConfig(
                  context: context,
                  directoryName: _directoryName,
                  formFileName: _formFileName),
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
