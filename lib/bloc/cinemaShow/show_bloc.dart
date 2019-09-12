import 'package:flutter/widgets.dart';
import 'package:phelum/bloc/cinemaShow/show_event.dart';
import 'package:phelum/bloc/cinemaShow/show_state.dart';
import 'package:bloc/bloc.dart';
import 'package:phelum/data/firebase_movie_repository.dart';

class ShowBloc extends Bloc<CinemaEvent, CinemaState> {
  final FirebaseMovieRepository firebaseMovieRepository;

  ShowBloc({@required this.firebaseMovieRepository});

  @override
  CinemaState get initialState => CinemaShowLoading();

  @override
  Stream<CinemaState> mapEventToState(CinemaEvent event) async* {
    if(event is LoadValidCinemas) {
      yield* _mapLoadCinemaDetailsToState(event.movieId);
    }
  }

  Stream<CinemaState> _mapLoadCinemaDetailsToState(int movieId) async* {
    yield CinemaShowLoading();
    try {
      final movie = await this.firebaseMovieRepository.cinemaDetails(movieId);
      yield CinemaShowLoaded(movie);
    }catch(err){
      print(state);
      yield CinemaShowNotLoaded();
    }
  }
}