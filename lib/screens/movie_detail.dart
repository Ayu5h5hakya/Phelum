import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/screens/seat_reservation.dart';
import 'package:phelum/widgets/genre_tag.dart';
import 'package:phelum/widgets/rating.dart';
import 'package:phelum/widgets/synopsis_view.dart';

class MovieDetail extends StatelessWidget {
  static const routeName = '/movie_detail';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Joker'),
                background: Image.asset(
                  'assets/images/minimalism.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: wetasphalt,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SynopsisWidget(),
              Row(
                children: <Widget>[
                  GenreTag(tagName: 'Crime'),
                  GenreTag(tagName: 'Drama'),
                  GenreTag(tagName: 'Thriller')
                ],
              ),
              Container(
                color: midnightblue,
                padding: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RatingWidget(),
                    Text(
                      '17+',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.event_seat),
        onPressed: () {
          _gotoSeatBooking(context);
        },
      ),
    );
  }

  void _gotoSeatBooking(BuildContext context) async {
    await Navigator.pushNamed(context, SeatReservationBooking.routeName);
  }
}
