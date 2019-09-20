import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const []]) : super(props);
}

class LoadProfile extends ProfileEvent {
  @override
  String toString() => 'LoadProfile';
}