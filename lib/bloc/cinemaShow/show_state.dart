import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/data/repository.dart';
import 'package:phelum/model/show_schedule.dart';

@immutable
abstract class CinemaState extends Equatable {
  CinemaState([List props = const []]) : super(props);
}

class CinemaShowLoading extends CinemaState {
  @override
  String toString() => 'CinemaShowLoading';
}

class CinemaShowLoaded extends CinemaState {
  final ParsedMoviesReponse<List<ShowSchedule>> cinemaDetail;

  CinemaShowLoaded([this.cinemaDetail]) : super([cinemaDetail]);

  @override
  String toString() => 'CinemaShowLoaded {detail : $cinemaDetail}';
}

class CinemaShowNotLoaded extends CinemaState {
  @override
  String toString() => 'CinemaShowNotLoaded';
}
