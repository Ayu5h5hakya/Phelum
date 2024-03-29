import 'package:flutter/cupertino.dart';
import 'package:phelum/bloc/detail/detail_state.dart';
import 'package:phelum/bloc/movie/movie_event.dart';
import 'package:phelum/bloc/movie/movie_state.dart';
import 'package:bloc/bloc.dart';
import 'package:phelum/data/firebase_movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final FirebaseMovieRepository firebaseMovieRepository;

  MovieBloc({@required this.firebaseMovieRepository});

  @override
  MovieState get initialState => MoviesLoading();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is LoadDashboardItems) {
      yield* _mapLoadDashboardItemsToState();
    }
  }

  Stream<MovieState> _mapLoadDashboardItemsToState() async* {
    try {
      final movies = await this.firebaseMovieRepository.movies();
      yield MoviesLoaded(movies);
    } catch (_) {
      yield MoviesNotLoaded();
    }
  }
}
