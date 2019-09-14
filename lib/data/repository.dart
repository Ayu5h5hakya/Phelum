import 'package:phelum/model/dashboard_item.dart';
import 'package:phelum/model/movie.dart';
import 'package:phelum/model/show_schedule.dart';

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
  Future<ParsedMoviesReponse<List<DashboardItem>>> movies();
  Future<ParsedMoviesReponse<Movie>> movieDetail(int id);
  Future<ParsedMoviesReponse<List<ShowSchedule>>> cinemaDetails(int id);
}