import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  MovieEvent([List props = const []]) : super(props);
}

class LoadMovies extends MovieEvent {
  @override
  String toString() => 'LoadMovies';
}