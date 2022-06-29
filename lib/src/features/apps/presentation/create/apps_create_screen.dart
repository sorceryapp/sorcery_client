import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/create/create_app_form.dart';
// import 'package:sorcery_desktop_v3/localization/l10n.dart';

class AppsCreateScreen extends StatelessWidget {
  const AppsCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CreateApp();
  }
}

class CreateApp extends StatelessWidget {
  const CreateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SizedBox box = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: const [
            box,
            Text(
              'Create App',
              // SorceryLocalizations.current.signInPageTitle,
              style: TextStyle(fontSize: 20),
            ),
            box,
            CreateAppForm(),
          ],
        ),
      ),
    );
  }
}
