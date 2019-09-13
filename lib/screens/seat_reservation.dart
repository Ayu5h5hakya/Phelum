import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/data/seat_repository.dart';
import 'package:phelum/model/selected_cinema.dart';
import 'package:phelum/widgets/screen_label.dart';
import 'package:phelum/widgets/seat_arrangement.dart';
import 'package:phelum/widgets/seat_legend.dart';

import '../colors.dart';

class SeatReservationBooking extends StatelessWidget {
  static const routeName = '/seat_reservation_booking';

  final SeatRepository seatRepository;
  final SelectedCinema selectedCinema;
  SeatReservationBooking({this.seatRepository, this.selectedCinema});

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
                        'Joker',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Text(
                        'QFX cinemas, Labim mall, Audi 3',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '12:30 PM',
                        style: TextStyle(fontSize: 15, color: Colors.white)
                      )
                    ],
                  ),
                ),
                Opacity(
                  opacity: 0.2,
                  child: Image.network(
                    "https://in.bmscdn.com/iedb/movies/images/mobile/listing/xxlarge/joker-et00100071-03-04-2019-10-23-41.jpg",
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
