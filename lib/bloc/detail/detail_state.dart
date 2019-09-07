import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/data/repository.dart';
import 'package:phelum/model/movie.dart';

@immutable
abstract class DetailState extends Equatable {
  DetailState([List props = const []]) : super(props);
}

class DetailLoading extends DetailState {
  @override
  String toString() => 'DetailLoading';
}

class MovieDetailLoaded extends DetailState {
  final ParsedMoviesReponse<Movie> movieDetail;

  MovieDetailLoaded([this.movieDetail]) : super([movieDetail]);

  @override
  String toString() => 'MovieDetailLoaded {detail : $movieDetail}';
}

class DetailsNotLoaded extends DetailState {
  @override
  String toString() => 'DetailsNotLoaded';
}
