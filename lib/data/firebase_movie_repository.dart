import 'dart:convert';

import 'package:phelum/data/repository.dart';
import 'package:phelum/model/movie.dart';
import 'package:http/http.dart' as http;

class FirebaseMovieRepository extends MovieRepository {
  static final baseUrl = 'https://coviva-6c25f.firebaseio.com/';
  static final moviesPath = 'movies.json';
  @override
  Future<ParsedMoviesReponse<List<Movie>>> movies() async {
    http.Response response =
        await http.get(baseUrl + moviesPath).catchError((err) {});

    if (response == null) return new ParsedMoviesReponse(NO_INTERNET, []);

    if (response.statusCode < 200 || response.statusCode >= 300)
      return new ParsedMoviesReponse(response.statusCode, []);

    final list = json.decode(response.body) as List;
    print(list);
    return new ParsedMoviesReponse(
        response.statusCode,
        list.map((element) {
          return Movie(
              element['title'],
              element['poster_portrait'],
              element['poster_landscape'],
              element['rating'],
              element['runtime'],
              element['release_date'],
              element['p_rating']);
        }).toList());
  }
}
