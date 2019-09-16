import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/auth/auth_bloc.dart';
import 'package:phelum/bloc/cinemaShow/show_bloc.dart';
import 'package:phelum/bloc/cinemaShow/show_event.dart';
import 'package:phelum/bloc/cinemaShow/show_state.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/model/booking.dart';
import 'package:phelum/model/show_schedule.dart';
import 'package:phelum/screens/seat_reservation.dart';
import 'package:phelum/widgets/checkout_navigation_wrapper.dart';
import 'package:phelum/widgets/time_tag.dart';

class CinemaLocation extends StatelessWidget {
  static const routeName = '/cinema_location';
  final Booking booking;

  CinemaLocation({this.booking});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowBloc>(context)
      ..dispatch(LoadValidCinemas(movieId: booking.movieId));
    return Scaffold(
        appBar: AppBar(
          title: Text('Cinemas'),
        ),
        backgroundColor: midnightblue,
        body: BlocBuilder<ShowBloc, CinemaState>(
          builder: (context, state) {
            if (state is CinemaShowLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CinemaShowLoaded) {
              return _getShowCinemas(context, state.cinemaDetail.body);
            } else {
              return Text('err');
            }
          },
        ));
  }

  Widget _getShowCinemas(BuildContext context, List<ShowSchedule> shows) {
    return ListView.builder(
      itemCount: shows.length,
      itemBuilder: (context, index) {
        if (shows.elementAt(index) is CinemaData) {
          return ListTile(
              title: Text(
                shows.elementAt(index).cinemaName,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                (shows.elementAt(index) as CinemaData).address,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                (shows.elementAt(index) as CinemaData).rating.toString(),
                style: TextStyle(color: Colors.white),
              ));
        } else if (shows.elementAt(index) is DateTimeData) {
          return _getTimeGrid(
              context,
              (shows.elementAt(index) as DateTimeData).cinemaName,
              (shows.elementAt(index) as DateTimeData)
                  .showTime
                  .getGridFriendlyList());
        }
      },
    );
  }

  Widget _getTimeGrid(
      BuildContext context, String cinema, List<String> timeValues) {
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
              _gotoSeatBooking(context, cinema, timeValues.elementAt(0),
                  timeValues.elementAt(index));
            },
          );
        }
      }),
    );
  }

  void _gotoSeatBooking(BuildContext context, String cinema, String date,
      String time_code) async {
    booking.cinemaName = cinema;
    booking.movieTime = time_code;
    booking.movieDate = date;
    await Navigator.pushNamed(context, CheckoutavigationWrapper.routeName,
        arguments: booking);
  }
}
