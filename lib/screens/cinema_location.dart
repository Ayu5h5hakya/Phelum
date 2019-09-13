import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/cinemaShow/show_bloc.dart';
import 'package:phelum/bloc/cinemaShow/show_event.dart';
import 'package:phelum/bloc/cinemaShow/show_state.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/model/cinema_show.dart';
import 'package:phelum/model/selected_cinema.dart';
import 'package:phelum/screens/seat_reservation.dart';
import 'package:phelum/widgets/genre_tag.dart';
import 'package:phelum/widgets/location_expansiontile.dart';
import 'package:phelum/widgets/time_tag.dart';

class CinemaLocation extends StatelessWidget {
  static const routeName = '/cinema_location';
  final int movie_id;

  CinemaLocation({this.movie_id});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowBloc>(context)
      ..dispatch(LoadValidCinemas(movieId: movie_id));
    return Scaffold(
        appBar: AppBar(
          title: Text('Cinemas'),
        ),
        body: BlocBuilder<ShowBloc, CinemaState>(
          builder: (context, state) {
            if (state is CinemaShowLoading) {
              return Container(
                color: midnightblue,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is CinemaShowLoaded) {
              return Container(
                color: midnightblue,
                child: _getShowCinemas(context, state.cinemaDetail.body),
              );
            } else {
              return Text('err');
            }
          },
        ));
  }

  Widget _getShowCinemas(BuildContext context, List<CinemaShow> shows) {
    return ListView.builder(
      itemCount: shows.length,
      itemBuilder: (context, index) {
        return CinemaLocationTile(
          title: Text(
            shows[index].name,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            shows[index].address,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Text(
            shows[index].rating.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: Container(
            child: _getShowCinemaTimes(context, index, shows[index]),
          ),
        );
      },
    );
  }

  Widget _getShowCinemaTimes(
      BuildContext context, int cinema_id, CinemaShow show) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: show.showTimes.length,
      itemBuilder: (context, index) {
        return _getTimeGrid(
            context, cinema_id, show.showTimes[index].getGridFriendlyList());
      },
    );
  }

  Widget _getTimeGrid(
      BuildContext context, int cinema_id, List<String> timeValues) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 5,
      childAspectRatio: 1.6,
      children: List.generate(timeValues.length, (index) {
        if (index == 0) {
          return Align(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: Text(
                timeValues[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
            alignment: Alignment.centerLeft,
          );
        } else {
          return GestureDetector(
            child: TimeTag(
              timeString: timeValues[index],
            ),
            onTap: () {
              print(index);
              _gotoSeatBooking(context, cinema_id, timeValues.elementAt(index));
            },
          );
        }
      }),
    );
  }

  void _gotoSeatBooking(
      BuildContext context, int cinema_id, String time_code) async {
    await Navigator.pushNamed(context, SeatReservationBooking.routeName,
        arguments: SelectedCinema(cinemaId: cinema_id, timeCode: time_code));
  }
}
