import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class CinemaEvent extends Equatable {
  CinemaEvent([List props = const []]) : super(props);
}

class LoadValidCinemas extends CinemaEvent {
  final int movieId;

  LoadValidCinemas({@required this.movieId}) : super([movieId]);
  @override
  String toString() => 'LoadValidCinemas';
}
