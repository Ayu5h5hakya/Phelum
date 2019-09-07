import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';

class SwitchableMetaInformation extends StatelessWidget {
  final String director;
  final String budget;
  final String location;
  final String ratio;

  SwitchableMetaInformation(
      {this.director, this.budget, this.location, this.ratio});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if(director != null)
        Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Director',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(director,
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ),
        if(budget != null)
        Container(
          color: midnightblue,
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Budget',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(budget, style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ),
        if (location != null)
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Location',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(location,
                    style: TextStyle(color: Colors.white, fontSize: 16))
              ],
            ),
          ),
        if (ratio != null)
          Container(
            color: midnightblue,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Aspect Ratio',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(ratio, style: TextStyle(color: Colors.white, fontSize: 16))
              ],
            ),
          )
      ],
    );
  }
}
