import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/data/repository.dart';
import 'package:phelum/model/user_profile.dart';

@immutable
abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

class Uninitializaed extends AuthState {
  @override
  String toString() => 'Uninitialized';
}

class ConfirmingBooking extends AuthState {
  @override
  String toString() => 'ConfirmingBooking';
}

class ConfirmationComplete extends AuthState {
  @override
  String toString() => 'ConfirmationComplete';
}

class ProfileLoaded extends AuthState {
  final ParsedMoviesReponse<UserProfile> profile;

  ProfileLoaded({@required this.profile}) : super([profile]);
  @override
  String toString() => 'Userprofile {profile : $profile}';
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
