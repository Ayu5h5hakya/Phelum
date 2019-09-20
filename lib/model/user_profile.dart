import 'package:phelum/model/booking.dart';

class UserProfile{
  final String email;
  final String address;
  final List<Booking> bookings;

  UserProfile({this.email, this.address, this.bookings});

  static UserProfile fromJson(Map<String, Object> json) {
    List<Booking> previousBookings = [];
    (json['confirmations'] as Map<String, Object>).forEach((key, value){
      final bookingMap = value as Map<String, Object>;
      previousBookings.add(Booking(
        cinemaName: bookingMap['cinema_name'],
        movieDate: bookingMap['movie_date'],
        movieId: bookingMap['movie_id'],
        movieName: bookingMap['movie_name'],
        movieTime: bookingMap['movie_time'],
        price: bookingMap['price'],
        seats: bookingMap['seats'],
        userName: bookingMap['user_name']
      ));
    });
    return UserProfile(
        email : json['email'] as String,
        address : json['address'] as String,
        bookings : previousBookings);
  }

  @override
  String toString() => 'UserProfile {email : $email, address : $address, bookings : $bookings}';
}