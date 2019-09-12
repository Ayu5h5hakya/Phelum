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
              return ListView.builder(
                itemCount: state.cinemaDetail.body.length,
                itemBuilder: (context, index) {
                  return CinemaLocationTile(
                    title: Text(state.cinemaDetail.body[index].name),
                    subtitle: Text(state.cinemaDetail.body[index].address),
                    trailing: Text(state.cinemaDetail.body[index].rating.toString()),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text('Today'),
                          trailing: Text('182'),
                        ),
                        ListTile(
                          title: Text('Tomorrow'),
                          trailing: Text('182'),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            else{
              return Text('err');
            }
          },
        ));
  }
}
