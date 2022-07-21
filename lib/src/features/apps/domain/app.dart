import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sorcery_desktop_v3/src/features/apps/domain/isar_blueprint_converter.dart';

part 'app.g.dart';

@Collection()
class App {
  App({
    required this.appId,
    required this.name,
    required this.frameworkId,
    required this.typeId,
    required this.blueprint,
    this.path,
    required this.permission,
  });

  var id = Isar.autoIncrement;
  final int appId;
  final String name;
  final int frameworkId;
  final int typeId;

  @IsarBlueprintConverter()
  final Map<dynamic, dynamic> blueprint;
  final String? path;
  final String permission;

  App copyWith({
    int? appId,
    String? name,
    int? frameworkId,
    int? typeId,
    Map<dynamic, dynamic>? blueprint,
    String? path,
    String? permission,
  }) {
    return App(
      appId: appId ?? this.appId,
      name: name ?? this.name,
      frameworkId: frameworkId ?? this.frameworkId,
      typeId: typeId ?? this.typeId,
      blueprint: blueprint ?? this.blueprint,
      path: path ?? this.path,
      permission: permission ?? this.permission,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appId': appId,
      'name': name,
      'frameworkId': frameworkId,
      'typeId': typeId,
      'blueprint': blueprint,
      'path': path,
      'permission': permission,
    };
  }

  factory App.fromMap(Map<String, dynamic> map) {
    return App(
      appId: map['id'] as int,
      name: map['name'] as String,
      frameworkId: map['frameworkId'] as int,
      typeId: map['typeId'] as int,
      blueprint: Map<dynamic, dynamic>.from(
          (map['blueprint'] as Map<dynamic, dynamic>)),
      path: map['path'] != null ? map['path'] as String : null,
      permission: map['permission'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory App.fromJson(String source) =>
      App.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'App(appId: $appId, name: $name, frameworkId: $frameworkId, typeId: $typeId, blueprint: $blueprint, path: $path, permission: $permission)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is App &&
        other.appId == appId &&
        other.name == name &&
        other.frameworkId == frameworkId &&
        other.typeId == typeId &&
        mapEquals(other.blueprint, blueprint) &&
        other.path == path &&
        other.permission == permission;
  }

  @override
  int get hashCode {
    return appId.hashCode ^
        name.hashCode ^
        frameworkId.hashCode ^
        typeId.hashCode ^
        blueprint.hashCode ^
        path.hashCode ^
        permission.hashCode;
  }
}
