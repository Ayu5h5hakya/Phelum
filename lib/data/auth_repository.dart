import 'package:phelum/data/repository.dart';
import 'package:phelum/model/booking.dart';
import 'package:phelum/model/user_profile.dart';

abstract class UserRepository{
  Future<bool> isAuthenticated();

  Future<void> authenticate(String email, String password);

  Future<String> getUserId();

  Future<void> confirmBooking(Booking booking);
  
  Future<ParsedMoviesReponse<UserProfile>> getUserProfile();
}