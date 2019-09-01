import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/screens/movie_detail.dart';
import 'package:phelum/widgets/movie_card.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      
      controller: PageController(initialPage: 0, viewportFraction: 0.8),
      children: <Widget>[
        MovieCard(
          title: 'Page2',
          imagePath: 'assets/images/test2.jpg',
          onPageClicked: (id) {
            _gotoDetails(context);
          },
        ),
        MovieCard(
          title: 'Page3',
          imagePath: 'assets/images/test3.jpg',
          onPageClicked: (id) {
            _gotoDetails(context);
          },
        ),
      ],
    );
  }

  void _gotoDetails(BuildContext context) async {
    await Navigator.pushNamed(context, MovieDetail.routeName);
  }
}
