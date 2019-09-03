import 'package:flutter/foundation.dart';

@immutable
class LoginState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  LoginState(
      {@required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure});

  factory LoginState.empty() =>
      LoginState(isSubmitting: false, isSuccess: false, isFailure: false);

  factory LoginState.failure() =>
      LoginState(isSubmitting: false, isSuccess: false, isFailure: true);

  factory LoginState.loading() =>
      LoginState(isSubmitting: true, isFailure: false, isSuccess: false);

  factory LoginState.success() =>
      LoginState(isSubmitting: false, isSuccess: true, isFailure: false);

  @override
  String toString() => '''LoginState {
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
}
