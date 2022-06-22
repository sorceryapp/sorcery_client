import 'package:flutter/material.dart';

class AppsCreateScreen extends StatelessWidget {
  const AppsCreateScreen({Key? key}) : super(key: key);

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
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
