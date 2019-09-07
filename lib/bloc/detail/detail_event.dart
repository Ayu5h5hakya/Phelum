import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class DetailEvent extends Equatable {
  DetailEvent([List props = const []]) : super(props);
}

class LoadMovieDetails extends DetailEvent {
  final int movieId;

  LoadMovieDetails({@required this.movieId}) : super([movieId]);
  @override
  String toString() => 'LoadMovieDetails';
}
