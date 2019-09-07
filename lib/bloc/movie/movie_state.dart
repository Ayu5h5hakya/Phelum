import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:phelum/data/repository.dart';
import 'package:phelum/model/dashboard_item.dart';
import 'package:phelum/model/movie.dart';

@immutable
abstract class MovieState extends Equatable {
  MovieState([List props = const []]) : super(props);
}

class MoviesLoading extends MovieState {
  @override
  String toString() => 'MoviesLoading';
}

class MoviesLoaded extends MovieState {
  final ParsedMoviesReponse<List<DashboardItem>> movies;

  MoviesLoaded([this.movies]) : super([movies]);

  @override
  String toString() => 'MoviesLoaded { todos: $movies }';
}

class MoviesNotLoaded extends MovieState {
  @override
  String toString() => 'MoviesNotLoaded';
}

