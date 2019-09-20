import 'package:flutter/material.dart';

class ScreenLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Text(
            'Screen',),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            width: 350,
            height: 5,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
