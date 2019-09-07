import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class MovieEvent extends Equatable {
  MovieEvent([List props = const []]) : super(props);
}

class LoadDashboardItems extends MovieEvent {
  @override
  String toString() => 'LoadDashboardItems';
}

class LoadMovieDetails extends MovieEvent {
  final int movieId;

  LoadMovieDetails({@required this.movieId}) : super([movieId]);
  @override
  String toString() => 'LoadMovieDetails';
}
