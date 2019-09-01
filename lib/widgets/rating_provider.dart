import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/colors.dart';

class RatingProviderTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(3.0),
      child: Text(
        'IMDB',
        style: TextStyle(
          fontSize: 13,
          color: Colors.white
        ),),
      decoration: BoxDecoration(
        color: lightgreenishblue,
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
    );
  }
}