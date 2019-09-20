import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/colors.dart';

class GenreTag extends StatelessWidget {
  String tagName;

  GenreTag({Key key, this.tagName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(color: brightyarrow),
      child: Text(
        tagName,
        style: TextStyle(color: Colors.black), 
      ),
    );
  }
}
