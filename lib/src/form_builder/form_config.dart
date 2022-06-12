import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

class FormConfig {
  Future<Map<dynamic, dynamic>> getFormConfig(
      {required BuildContext context, required String formFileName}) async {
    final yamlString = await DefaultAssetBundle.of(context)
        .loadString('assets/form_configs/$formFileName');
    return loadYaml(yamlString);
  }
}
