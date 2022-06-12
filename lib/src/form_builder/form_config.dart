import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

class FormConfig {
  Future<Map<dynamic, dynamic>> getFormConfig(
      {required BuildContext context,
      required String directoryName,
      required String formFileName}) async {
    final yamlString = await DefaultAssetBundle.of(context)
        .loadString('assets/form_configs/$directoryName/$formFileName');
    return loadYaml(yamlString);
  }
}
