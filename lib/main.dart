import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/auth/auth_bloc.dart';
import 'package:phelum/bloc/auth/auth_event.dart';
import 'package:phelum/bloc/cinemaShow/show_bloc.dart';
import 'package:phelum/bloc/detail/detail_bloc.dart';
import 'package:phelum/bloc/login/login_bloc.dart';
import 'package:phelum/bloc/movie/movie_bloc.dart';
import 'package:phelum/bloc/movie/movie_event.dart';
import 'package:phelum/bloc/profile/profile_bloc.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/data/firebase_movie_repository.dart';
import 'package:phelum/data/firebase_user_repository.dart';
import 'package:phelum/data/seat_repository.dart';
import 'package:phelum/model/cinema_show.dart';
import 'package:phelum/screens/cinema_location.dart';
import 'package:phelum/screens/dashboard.dart';
import 'package:phelum/screens/movie_detail.dart';
import 'package:phelum/screens/seat_reservation.dart';
import 'package:phelum/widgets/checkout_navigation_wrapper.dart';
import 'package:phelum/widgets/profile_navigation_wrapper.dart';

import 'bloc/auth/auth_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final FirebaseUserRepository firebaseUserRepository =
      FirebaseUserRepository();
  static final FirebaseMovieRepository firebaseMovieRepository =
      FirebaseMovieRepository();
  static final SeatRepository seatRepository = SeatRepository();

  final MovieBloc movieBloc =
      MovieBloc(firebaseMovieRepository: firebaseMovieRepository);
  final LoginBloc loginBloc =
      LoginBloc(firebaseUserRepository: firebaseUserRepository);
  final DetailBloc detailBloc =
      DetailBloc(firebaseMovieRepository: firebaseMovieRepository);
  final ShowBloc showBloc =
      ShowBloc(firebaseMovieRepository: firebaseMovieRepository);
  final ProfileBloc profileBloc =
      ProfileBloc(firebaseUserRepository: firebaseUserRepository);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) =>
          AuthenticationBloc(firebaseUserRepository: firebaseUserRepository)
            ..dispatch(AppStarted()),
      child: _getMaterialApp(),
    );
  }

  Widget _getMaterialApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: wetasphalt),
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
          case CheckoutavigationWrapper.routeName:
            {
              return MaterialPageRoute(builder: (context) {
                return BlocProvider.value(
                  value: loginBloc,
                  child: CheckoutavigationWrapper(
                      seatRepository: seatRepository,
                      booking: settings.arguments),
                );
              });
            }
          case ProfileavigationWrapper.routeName:
            {
              return MaterialPageRoute(builder: (context) {
                return BlocProvider.value(
                  value: loginBloc,
                  child: ProfileavigationWrapper(
                    userRepository: firebaseUserRepository,
                  ),
                );
              });
            }
          case MovieDetail.routeName:
            {
              return MaterialPageRoute(builder: (context) {
                return BlocProvider.value(
                  value: detailBloc,
                  child: MovieDetail(movie_id: settings.arguments),
                );
              });
            }
          case CinemaLocation.routeName:
            {
              return MaterialPageRoute(builder: (context) {
                return BlocProvider.value(
                  value: showBloc,
                  child: CinemaLocation(booking: settings.arguments),
                );
              });
            }
        }
      },
    );
  }
}
