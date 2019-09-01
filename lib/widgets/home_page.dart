import 'package:flutter/material.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/screens/dashboard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Showing'),
        backgroundColor: wetasphalt,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_outline,color: Colors.white,),
          )
        ],
      ),
      body: Container(
        child: Dashboard(),
        color: wetasphalt,
      ),
    );
  }
}
