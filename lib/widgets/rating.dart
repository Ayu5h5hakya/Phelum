import 'package:flutter/material.dart';
import 'package:phelum/widgets/rating_provider.dart';

class RatingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text(
          '8.8',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        RatingProviderTag()
      ],
    );
  }
}
