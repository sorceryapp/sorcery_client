// import 'package:flutter/material.dart';

// class AppsCreateScreen extends StatelessWidget {
//   const AppsCreateScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const SizedBox box = SizedBox(height: 20);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Sorcery')),
//       body: Center(
//         child: Column(
//           children: const [
//             box,
//             Text(
//               'Create App',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_builder.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_config.dart';

class AppsCreateScreen extends StatelessWidget {
  const AppsCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CreateApp();
  }
}

class CreateApp extends StatelessWidget {
  const CreateApp({Key? key}) : super(key: key);
  final String _directoryName = 'apps';
  final String _formFileName = 'create_app.yaml';

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
              'Create App',
              // SorceryLocalizations.current.signInPageTitle,
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
