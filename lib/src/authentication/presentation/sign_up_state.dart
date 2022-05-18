// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpState {
  SignUpState({
    this.value = const AsyncValue.data(null),
  });

  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  SignUpState copyWith({
    AsyncValue<void>? value,
  }) {
    return SignUpState(
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'SignUpState(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpState && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class SignUpState {
//   SignUpState({
//     this.value = const AsyncValue.data(null),
//   });

//   final AsyncValue<void> value;

//   bool get isLoading => value.isLoading;

//   SignUpState copyWith({
//     AsyncValue<void>? value,
//   }) {
//     return SignUpState(
//       value: value ?? this.value,
//     );
//   }

//   @override
//   String toString() => 'SignUpState(value: $value)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is SignUpState && other.value == value;
//   }

//   @override
//   int get hashCode => value.hashCode;
// }
