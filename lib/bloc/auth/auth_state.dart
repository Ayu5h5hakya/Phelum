import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

class Uninitializaed extends AuthState {
  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthState {
  String displayName;

  Authenticated(this.displayName) : super([displayName]);
  @override
  String toString() => 'Authenticated';
}

class Unauthenticated extends AuthState {
  @override
  String toString() => 'Unauthenticated';
}