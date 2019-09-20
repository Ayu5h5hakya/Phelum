import 'package:flutter/material.dart';
import 'package:phelum/colors.dart';

class SynopsisWidget extends StatelessWidget {
  final String value;
  SynopsisWidget({this.value});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: midnightblue,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text('SYNOPSIS',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20)),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
