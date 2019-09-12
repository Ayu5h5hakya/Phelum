import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/cinemaShow/show_bloc.dart';
import 'package:phelum/bloc/cinemaShow/show_event.dart';
import 'package:phelum/bloc/cinemaShow/show_state.dart';
import 'package:phelum/model/cinema_show.dart';
import 'package:phelum/widgets/location_expansiontile.dart';

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
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CinemaShowLoaded) {
              return _getShowCinemas(state.cinemaDetail.body);
            } else {
              return Text('err');
            }
          },
        ));
  }

  Widget _getShowCinemas(List<CinemaShow> shows) {
    return ListView.builder(
      itemCount: shows.length,
      itemBuilder: (context, index) {
        return CinemaLocationTile(
          title: Text(shows[index].name),
          subtitle: Text(shows[index].address),
          trailing: Text(shows[index].rating.toString()),
          child: Container(
            child: _getShowCinemaTimes(shows[index]),
          ),
        );
      },
    );
  }

  Widget _getShowCinemaTimes(CinemaShow show) {
    return ListView.builder(
              shrinkWrap: true,
              itemCount: show.showTimes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      show.showTimes[index]),
                );
              },
            );
  }
}
