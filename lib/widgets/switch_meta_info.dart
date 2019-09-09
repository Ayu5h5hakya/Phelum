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
        Visibility(
          visible: director != null,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Director',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text('$director',
                    style: TextStyle(color: Colors.white, fontSize: 16))
              ],
            ),
          ),
        ),
        Visibility(
          visible: budget != null,
          child: Container(
            color: midnightblue,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Budget',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text('$budget',
                    style: TextStyle(color: Colors.white, fontSize: 16))
              ],
            ),
          ),
        ),
        Visibility(
          visible: location != null,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Location',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text('$location',
                    style: TextStyle(color: Colors.white, fontSize: 16))
              ],
            ),
          ),
        ),
        Visibility(
          visible: ratio != null,
          child: Container(
            color: midnightblue,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Aspect Ratio',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text('$ratio', style: TextStyle(color: Colors.white, fontSize: 16))
              ],
            ),
          ),
        )
      ],
    );
  }
}
