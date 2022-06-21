import 'package:flutter/material.dart';

class AppsShowScreen extends StatelessWidget {
  const AppsShowScreen({Key? key, required String appId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'App Show Screen',
      style: TextStyle(fontSize: 20),
    );
  }
}
