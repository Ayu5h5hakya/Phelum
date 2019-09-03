import 'package:phelum/model/movie.dart';

final int NO_INTERNET = 404;

class ParsedMoviesReponse<T> {
  final int statusCode;
  final T body;
  ParsedMoviesReponse(this.statusCode, this.body);

  bool isOk(){
    return statusCode >= 200 && statusCode <= 300;
  }
}

abstract class MovieRepository {
  Future<ParsedMoviesReponse<List<Movie>>> movies();
}