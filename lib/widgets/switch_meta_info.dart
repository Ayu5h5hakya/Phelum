import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';

class SwitchableMetaInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Director',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text('Todd Phillips',
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ),
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
              Text('\$55,000,000',
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Location',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text('USA', style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ),
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
              Text('1.85:1',
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        )
      ],
    );
  }
}
