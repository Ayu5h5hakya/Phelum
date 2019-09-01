import 'package:flutter/material.dart';
import 'package:phelum/screens/movie_detail.dart';
import 'package:phelum/screens/seat_reservation.dart';
import 'package:phelum/widgets/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      onGenerateRoute: (settings) {
        switch(settings.name){
          case MovieDetail.routeName: {
          return MaterialPageRoute(
            builder: (context){
              return MovieDetail();
            }
          );
          }
          case SeatReservationBooking.routeName: {
          return MaterialPageRoute(
            builder: (context){
              return SeatReservationBooking();
            }
          );
          }
        }
      },
    );
  }
}
