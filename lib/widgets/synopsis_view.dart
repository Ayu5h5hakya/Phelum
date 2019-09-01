import 'package:flutter/material.dart';
import 'package:phelum/colors.dart';

class SynopsisWidget extends StatelessWidget {
  final value =
      'An original standalone origin story of the iconic villain not seen before on the big screen, it\'s a gritty character study of Arthur Fleck, a man disregarded by society, and a broader cautionary tale. ';
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
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
