// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  AuthState({
    this.value = const AsyncValue.data(null),
  });
  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  AuthState copyWith({
    AsyncValue<void>? value,
  }) {
    return AuthState(
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'AuthState(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
