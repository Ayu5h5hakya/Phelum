import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/model/booking.dart';
import 'package:phelum/model/user_profile.dart';

@immutable
abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class ConfirmBooking extends AuthEvent {
  final Booking booking;

  ConfirmBooking({@required this.booking}) : super([booking]);

  @override
  String toString() => 'ConfirmBooking : $booking';
}

class LoggedIn extends AuthEvent {
  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthEvent {
  @override
  String toString() => 'LoggedOut';
}
