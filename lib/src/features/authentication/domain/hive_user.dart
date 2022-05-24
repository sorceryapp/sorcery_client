// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'hive_user.g.dart';

@HiveType(typeId: 1)
class HiveUser {
  HiveUser({
    required this.accountId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.status,
  });

  @HiveField(0)
  final int accountId;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String firstName;

  @HiveField(3)
  final String lastName;

  @HiveField(4)
  final String status;

  HiveUser copyWith({
    int? accountId,
    String? email,
    String? firstName,
    String? lastName,
    String? status,
  }) {
    return HiveUser(
      accountId: accountId ?? this.accountId,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountId': accountId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'status': status,
    };
  }

  factory HiveUser.fromMap(Map<String, dynamic> map) {
    return HiveUser(
      accountId: map['accountId'] as int,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HiveUser.fromJson(String source) =>
      HiveUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HiveUser(accountId: $accountId, email: $email, firstName: $firstName, lastName: $lastName, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HiveUser &&
        other.accountId == accountId &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.status == status;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        status.hashCode;
  }
}
