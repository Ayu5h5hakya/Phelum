import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:phelum/data/auth_repository.dart';
import 'package:phelum/data/repository.dart';
import 'package:phelum/model/booking.dart';
import 'package:http/http.dart' as http;
import 'package:phelum/model/user_profile.dart';

class FirebaseUserRepository extends UserRepository {
  FirebaseAuth firebaseAuth;
  FirebaseDatabase firebaseDatabase;
  DatabaseReference confirmationsDB, profileDB;
  static final baseUrl = 'https://coviva-6c25f.firebaseio.com/phelum/';
  static final jsonExt = '.json';
  static final profilePath = 'profile';

  FirebaseUserRepository(
      {FirebaseAuth firebaseAuth, FirebaseDatabase firebaseDatabase}) {
    this.firebaseAuth = FirebaseAuth.instance;
    this.firebaseDatabase = FirebaseDatabase.instance;
    confirmationsDB =
        this.firebaseDatabase.reference().child('phelum/profile/confirmations');
    profileDB = this.firebaseDatabase.reference().child('phelum/profile');
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

  @override
  Future<ParsedMoviesReponse<UserProfile>> getUserProfile() async {
    http.Response response =
        await http.get(baseUrl + profilePath + jsonExt).catchError((err) {
      print(err);
    });

    if (response == null)
      return new ParsedMoviesReponse(NO_INTERNET, UserProfile());
    if (response.statusCode < 200 || response.statusCode >= 300)
      return new ParsedMoviesReponse(response.statusCode, UserProfile());
    final object = UserProfile.fromJson(json.decode(response.body));
    print(object);
    return ParsedMoviesReponse(response.statusCode, object);
  }
}
