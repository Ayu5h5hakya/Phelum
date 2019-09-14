enum ScheduleItem { CinemaInfo, ScheduleDateTime }

abstract class ShowSchedule {
  final ScheduleItem scheduletype;
  final String cinemaName;
  ShowSchedule(this.scheduletype,this.cinemaName);
}

class CinemaData extends ShowSchedule {
  final String address;
  final double rating;
  CinemaData({String name, this.address, this.rating})
      : super(ScheduleItem.CinemaInfo, name);

  static CinemaData fromJson(Map<String, Object> json) => CinemaData(
      name: json['cinema_name'] as String,
      address: json['cinema_address'] as String,
      rating: json['cinema_rating'] as double);

  @override
  String toString() =>
      'CinemaShow {address : $address, rating : $rating}';
}

class DateTimeData extends ShowSchedule {
  final ShowtimeValue showTime;
  DateTimeData({String cinemaName, this.showTime}) : super(ScheduleItem.ScheduleDateTime, cinemaName);

  static DateTimeData fromJson(MapEntry json) {
    return DateTimeData(showTime: ShowtimeValue(date: json.key, times: List<String>.from(json.value)));
  }

  @override
  String toString() => 'DateTimeData {showTimes : $showTime}';
}

class ShowtimeValue {
  final String date;
  final List<String> times;
  ShowtimeValue({this.date, this.times});

  @override
  String toString() => 'ShowTimeValue {date : $date, times : $times}';

  List<String> getGridFriendlyList() => []
    ..add(date)
    ..addAll(times);
}
