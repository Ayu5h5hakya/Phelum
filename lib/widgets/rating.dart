import 'package:flutter/material.dart';
import 'package:phelum/widgets/rating_provider.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  RatingWidget({this.rating});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text(
          '$rating',
          style: TextStyle(fontSize: 40),
        ),
        RatingProviderTag()
      ],
    );
  }
}
