import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/widgets/screen_label.dart';
import 'package:phelum/widgets/seat_arrangement.dart';
import 'package:phelum/widgets/seat_legend.dart';
import 'package:phelum/widgets/show_date.dart';
import 'package:phelum/widgets/show_time.dart';

import '../colors.dart';

class SeatReservationBooking extends StatelessWidget {
  static const routeName = '/seat_reservation_booking';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('seat'),
        backgroundColor: wetasphalt,
      ),
      body: Container(
        color: wetasphalt,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top : 6.0, bottom: 3.0, left: 8.0),
              child: Row(
                children: <Widget>[
                  ShowDate(),
                  ShowDate(),
                  ShowDate(),
                  ShowDate(),
                  ShowDate(),
                  ShowDate(),
                ],
              ),
            ),
            Row(children: <Widget>[
              ShowTime(),
              ShowTime(),
              ShowTime(),
            ]),
            Container(
              child: SeatingArrangement(),
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
