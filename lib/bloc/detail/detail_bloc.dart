import 'package:flutter/widgets.dart';
import 'package:phelum/bloc/detail/detail_event.dart';
import 'package:phelum/bloc/detail/detail_state.dart';
import 'package:bloc/bloc.dart';
import 'package:phelum/data/firebase_movie_repository.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final FirebaseMovieRepository firebaseMovieRepository;

  DetailBloc({@required this.firebaseMovieRepository});

  @override
  DetailState get initialState => DetailLoading();

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if(event is LoadMovieDetails) {
      yield* _mapLoadMovieDetailsToState(event.movieId);
    }
  }

  Stream<DetailState> _mapLoadMovieDetailsToState(int movieId) async* {
    yield DetailLoading();
    try {
      final movie = await this.firebaseMovieRepository.movieDetail(movieId);
      yield MovieDetailLoaded(movie);
    }catch(err){
      print(state);
      yield DetailsNotLoaded();
    }
  }
}