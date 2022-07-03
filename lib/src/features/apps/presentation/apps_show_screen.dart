import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/apps/domain/app.dart';

class AppsShowScreen extends StatelessWidget {
  final String _appId;
  final App? _app;
  const AppsShowScreen({required String appId, App? app, Key? key})
      : _appId = appId,
        _app = app,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    const SizedBox box = SizedBox(height: 20);

    if (_app != null) {
      print(_app.toString());

      switch (_app!.frameworkId) {
        case 22:
          if (_app!.typeId == 23) {
            // creat rails api app
            print('create rails api app');
          } else if (_app!.typeId == 24) {
            // create rails monolith app
            print('create rails monolith app');
          }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: [
            box,
            Text(
              'App $_appId',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
