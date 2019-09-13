import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/data/seat_repository.dart';
import 'package:phelum/model/booking.dart';
import 'package:phelum/model/selected_cinema.dart';
import 'package:phelum/widgets/screen_label.dart';
import 'package:phelum/widgets/seat_arrangement.dart';
import 'package:phelum/widgets/seat_legend.dart';

import '../colors.dart';

class SeatReservationBooking extends StatelessWidget {
  static const routeName = '/seat_reservation_booking';

  final SeatRepository seatRepository;
  final Booking booking;
  SeatReservationBooking({this.seatRepository, this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('seat'),
      ),
      body: Container(
        color: wetasphalt,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        booking.movieName,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Text(
                        booking.cinemaName,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        booking.movieTime,
                        style: TextStyle(fontSize: 15, color: Colors.white)
                      )
                    ],
                  ),
                ),
                Opacity(
                  opacity: 0.15,
                  child: Image.network(
                    booking.moviePoster,
                  ),
                ),
              ],
            ),
            Container(
              child: SeatingArrangement(seatRepository),
              margin: EdgeInsets.all(13.0),
              width: double.infinity,
              height: 270,
            ),
            SeatingLegend(),
            ScreenLabel()
          ],
        ),
      ),
    );
  }
}
