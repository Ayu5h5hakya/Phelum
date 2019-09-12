import 'package:meta/meta.dart';
import '../entity/movie_entity.dart';

/*
0

cinema_address:

cinema_name:

cinema_rating:

show_time

0:

        1:

1

cinema_address:

cinema_name:

cinema_rating:

show_time

        0:

2

cinema_address:

cinema_name:

cinema_rating:

show_time
*/
@immutable
class CinemaShow {
  final String name;
  final String address;
  final double rating;
  final List<String> showTimes;

  CinemaShow(
      this.name,
      this.address,
      this.rating,
      this.showTimes,);

  @override
  String toString() {
    return 'CinemaShow {name : $name, address : $address, rating : $rating, showTimes : $showTimes, }';
  }
}
