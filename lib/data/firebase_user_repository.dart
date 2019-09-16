import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:phelum/data/auth_repository.dart';
import 'package:phelum/model/booking.dart';

class FirebaseUserRepository extends UserRepository {
  FirebaseAuth firebaseAuth;
  FirebaseDatabase firebaseDatabase;
  DatabaseReference profileDB;

  FirebaseUserRepository(
      {FirebaseAuth firebaseAuth, FirebaseDatabase firebaseDatabase}) {
    this.firebaseAuth = FirebaseAuth.instance;
    this.firebaseDatabase = FirebaseDatabase.instance;
    profileDB =
        this.firebaseDatabase.reference().child('phelum/profile/confirmations');
  }

  @override
  Future<void> authenticate(String email, String password) {
    try {
      return firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (err) {
      print(err);
    }
  }

  @override
  Future<String> getUserId() async {
    return (await firebaseAuth.currentUser()).uid;
  }

  @override
  Future<bool> isAuthenticated() async {
    final currentUser = await firebaseAuth.currentUser();
    return currentUser != null;
  }

  @override
  Future<void> confirmBooking(Booking booking) {
    profileDB.push().set({
      'movie_id': booking.movieId,
      'movie_name': booking.movieName,
      'cinema_name': booking.cinemaName,
      'movie_date': booking.movieDate,
      'movie_time': booking.movieTime,
      'seats': booking.seats,
      'price': booking.price,
      'user_name': booking.userName
    }).then((_) {});
    return null;
  }
}
