import 'dart:convert';

import 'package:isar/isar.dart';

class IsarBlueprintConverter
    extends TypeConverter<Map<dynamic, dynamic>, String> {
  const IsarBlueprintConverter(); // Converters need to have an empty const constructor

  @override
  Map<dynamic, dynamic> fromIsar(String object) {
    return json.decode(object);
  }

  @override
  String toIsar(Map<dynamic, dynamic> object) {
    return json.encode(object);
  }
}
