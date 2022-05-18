// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.isAuthenticated = false,
    this.isVerified = false,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final bool isAuthenticated;
  final bool isVerified;

  User copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    bool? isAuthenticated,
    bool? isVerified,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'isAuthenticated': isAuthenticated,
      'isVerified': isVerified,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      isAuthenticated: map['isAuthenticated'] as bool,
      isVerified: map['isVerified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, isAuthenticated: $isAuthenticated, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.isAuthenticated == isAuthenticated &&
        other.isVerified == isVerified;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        isAuthenticated.hashCode ^
        isVerified.hashCode;
  }
}
