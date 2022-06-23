// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState {
  final AsyncValue<void> value;
  AppState({
    this.value = const AsyncValue.data(null),
  });

  AppState copyWith({
    AsyncValue<void>? value,
  }) {
    return AppState(
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'AppState(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
