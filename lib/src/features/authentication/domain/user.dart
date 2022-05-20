// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  User({
    required this.accountId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.status,
  });

  @Id()
  int? id;
  final int accountId;
  final String email;
  final String firstName;
  final String lastName;
  final String status;

  User copyWith({
    int? accountId,
    String? email,
    String? firstName,
    String? lastName,
    String? status,
  }) {
    return User(
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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      accountId: map['accountId'] as int,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(accountId: $accountId, email: $email, firstName: $firstName, lastName: $lastName, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
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
