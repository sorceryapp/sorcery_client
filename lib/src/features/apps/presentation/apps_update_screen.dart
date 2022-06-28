import 'package:flutter/material.dart';

class AppsUpdateScreen extends StatelessWidget {
  final String _appId;
  const AppsUpdateScreen({required String appId, Key? key})
      : _appId = appId,
        super(key: key);

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
              'Update App $_appId',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
