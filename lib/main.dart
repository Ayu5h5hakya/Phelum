import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/auth/auth_bloc.dart';
import 'package:phelum/bloc/auth/auth_event.dart';
import 'package:phelum/bloc/login/login_bloc.dart';
import 'package:phelum/bloc/movie/movie_bloc.dart';
import 'package:phelum/bloc/movie/movie_event.dart';
import 'package:phelum/data/firebase_movie_repository.dart';
import 'package:phelum/data/firebase_user_repository.dart';
import 'package:phelum/screens/dashboard.dart';
import 'package:phelum/screens/movie_detail.dart';
import 'package:phelum/screens/profile.dart';
import 'package:phelum/screens/seat_reservation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final FirebaseUserRepository firebaseUserRepository = FirebaseUserRepository(); 
  final MovieBloc movieBloc =
      MovieBloc(firebaseMovieRepository: FirebaseMovieRepository());
  final LoginBloc loginBloc = 
      LoginBloc(firebaseUserRepository: firebaseUserRepository);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AuthenticationBloc(firebaseUserRepository: firebaseUserRepository)..dispatch(AppStarted()),
      child: _getMaterialApp(),
    );
  }

  Widget _getMaterialApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MovieBloc>(
            builder: (context) => movieBloc,
          ),
          BlocProvider<LoginBloc>(
            builder: (context) => loginBloc,
          )
        ],
        child: Dashboard(),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MovieDetail.routeName:
            {
              return MaterialPageRoute(builder: (context) {
                return MovieDetail();
              });
            }
          case SeatReservationBooking.routeName:
            {
              return MaterialPageRoute(builder: (context) {
                return SeatReservationBooking();
              });
            }
          case ProfileScreen.routeName:
            {
              return MaterialPageRoute(
                builder: (context) {
                  return BlocProvider.value(
                    value: loginBloc,
                    child: ProfileScreen(),
                  );
                }
              );
            }
        }
      },
    );
  }
}
