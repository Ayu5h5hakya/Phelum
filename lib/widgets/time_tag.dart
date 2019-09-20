import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/widgets/Genre_painter.dart';

class TimeTag extends StatelessWidget {
  String timeString;

  TimeTag({Key key, this.timeString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: brightyarrow),
      child: Align(
        child: Text(
          timeString,
          style: TextStyle(color: Colors.black),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
