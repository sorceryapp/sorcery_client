// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class App {
  App({
    required this.appId,
    required this.name,
    required this.languageId,
    required this.frameworkId,
    required this.typeId,
    required this.blueprint,
  });

  @HiveField(0)
  final int appId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int languageId;

  @HiveField(3)
  final int frameworkId;

  @HiveField(4)
  final int typeId;

  @HiveField(5)
  final Map<dynamic, dynamic> blueprint;

  App copyWith({
    int? appId,
    String? name,
    int? languageId,
    int? frameworkId,
    int? typeId,
    Map<dynamic, dynamic>? blueprint,
  }) {
    return App(
      appId: appId ?? this.appId,
      name: name ?? this.name,
      languageId: languageId ?? this.languageId,
      frameworkId: frameworkId ?? this.frameworkId,
      typeId: typeId ?? this.typeId,
      blueprint: blueprint ?? this.blueprint,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appId': appId,
      'name': name,
      'languageId': languageId,
      'frameworkId': frameworkId,
      'typeId': typeId,
      'blueprint': blueprint,
    };
  }

  factory App.fromMap(Map<String, dynamic> map) {
    return App(
      appId: map['id'] as int,
      name: map['name'] as String,
      languageId: map['languageId'] as int,
      frameworkId: map['frameworkId'] as int,
      typeId: map['typeId'] as int,
      blueprint:
          Map<dynamic, dynamic>.from(map['blueprint'] as Map<dynamic, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory App.fromJson(String source) =>
      App.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'App(appId: $appId, name: $name, languageId: $languageId, frameworkId: $frameworkId, typeId: $typeId, blueprint: $blueprint)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is App &&
        other.appId == appId &&
        other.name == name &&
        other.languageId == languageId &&
        other.frameworkId == frameworkId &&
        other.typeId == typeId &&
        mapEquals(other.blueprint, blueprint);
  }

  @override
  int get hashCode {
    return appId.hashCode ^
        name.hashCode ^
        languageId.hashCode ^
        frameworkId.hashCode ^
        typeId.hashCode ^
        blueprint.hashCode;
  }
}
