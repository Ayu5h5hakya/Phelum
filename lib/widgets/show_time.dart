import 'package:flutter/material.dart';
import 'package:phelum/colors.dart';

class ShowTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(right: 8.0,left: 8.0),
      color: midnightblue,
      child: Text(
        '11 : 00 AM',
        style: TextStyle(color: Colors.white),
        ),
    );
  }
}