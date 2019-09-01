import 'package:flutter/material.dart';
import 'package:phelum/colors.dart';

class ShowDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: midnightblue,
      margin: EdgeInsets.only(right: 8.0),
      padding: EdgeInsets.only(
        top : 4.0,
        bottom: 4.0,
        left: 8.0,
        right: 8.0),
      child: Column(
        children: <Widget>[
          Text(
            'Day',
            style: TextStyle(color: Colors.white),),
          Text('26',
          style: TextStyle(
            fontSize: 19,
            color: Colors.white
          ),),
          Text(
            'Feb',
            style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
  
}