import 'dart:convert';

import 'package:phelum/data/repository.dart';
import 'package:phelum/entity/movie_entity.dart';
import 'package:phelum/model/cinema_show.dart';
import 'package:phelum/model/dashboard_item.dart';
import 'package:phelum/model/movie.dart';
import 'package:http/http.dart' as http;

class FirebaseMovieRepository extends MovieRepository {
  static final baseUrl = 'https://coviva-6c25f.firebaseio.com/';
  static final jsonExt = '.json';
  static final dashboardPath = 'dashboard';
  static final moviePath = 'movies';
  static final showsPath = 'shows';

  @override
  Future<ParsedMoviesReponse<List<DashboardItem>>> movies() async {
    http.Response response =
        await http.get(baseUrl + dashboardPath + jsonExt).catchError((err) {});

    if (response == null) return new ParsedMoviesReponse(NO_INTERNET, []);

    if (response.statusCode < 200 || response.statusCode >= 300)
      return new ParsedMoviesReponse(response.statusCode, []);

    final list = json.decode(response.body) as List;
    print(list);
    return new ParsedMoviesReponse(
        response.statusCode,
        list.map((element) {
          return DashboardItem(element['item_id'], element['title'],
              element['image_url'], element['rating']);
        }).toList());
  }

  @override
  Future<ParsedMoviesReponse<Movie>> movieDetail(int id) async {
    http.Response response = await http
        .get(baseUrl + moviePath + '/$id' + jsonExt)
        .catchError((err) {
      print(err);
    });

    if (response == null)
      return new ParsedMoviesReponse(NO_INTERNET, Movie.empty());
    if (response.statusCode < 200 || response.statusCode >= 300)
      return new ParsedMoviesReponse(response.statusCode, Movie.empty());
    final object = MovieEntity.fromJson(json.decode(response.body));
    print(object);
    return ParsedMoviesReponse(response.statusCode, Movie.fromEntity(object));
  }

  @override
  Future<ParsedMoviesReponse<List<CinemaShow>>> cinemaDetails(int id) async {
    http.Response response = await http
        .get(baseUrl + showsPath + jsonExt)
        .catchError((err) {
      print(err);
    });
    if (response == null) return new ParsedMoviesReponse(NO_INTERNET, []);
    if (response.statusCode < 200 || response.statusCode >= 300)
      return new ParsedMoviesReponse(response.statusCode, []);
    final list = json.decode(response.body) as List;
    print(list);
    return new ParsedMoviesReponse(
        response.statusCode,
        list.map((element) {
          return CinemaShow(element['cinema_name'], element['cinema_address'],
              element['cinema_rating'], []);
        }).toList());
  }
}
