import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SeatingLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5.0),
              width: 23,
              height: 23,
              color: Colors.blue,
            ),
            Text(
              'Available',
            )
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5.0),
              width: 23,
              height: 23,
              color: Colors.yellow,
            ),
            Text(
              'Selected',
            )
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5.0),
              width: 23,
              height: 23,
              color: Colors.grey,
            ),
            Text(
              'Sold',
            )
          ],
        ),
      ],
    );
  }
}
