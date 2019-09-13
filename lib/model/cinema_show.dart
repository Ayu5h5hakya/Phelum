import 'package:meta/meta.dart';

@immutable
class CinemaShow {
  final String name;
  final String address;
  final double rating;
  final List<ShowtimeValue> showTimes;

  CinemaShow(
    this.name,
    this.address,
    this.rating,
    this.showTimes,
  );

  @override
  String toString() {
    return 'CinemaShow {name : $name, address : $address, rating : $rating, showTimes : $showTimes, }';
  }

  static CinemaShow fromJson(Map<String, Object> json) => CinemaShow(
      json['cinema_name'] as String,
      json['cinema_address'] as String,
      json['cinema_rating'] as double,
      _getShowTimes(json['show_times']));

  static List<ShowtimeValue> _getShowTimes(Map<String, Object> json) {
    List<ShowtimeValue> showTimes = [];
    for (String key in json.keys) {
      showTimes
          .add(ShowtimeValue(date: key, times: List<String>.from(json[key])));
    }
    return showTimes;
  }
}

class ShowtimeValue {
  final String date;
  final List<String> times;

  ShowtimeValue({this.date, this.times});

  @override
  String toString() => 'ShowTimeValue {date : $date, times : $times}';

  List<String> getGridFriendlyList() => []..add(date)..addAll(times);
}
