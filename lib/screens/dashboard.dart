import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/movie/movie_bloc.dart';
import 'package:phelum/bloc/movie/movie_event.dart';
import 'package:phelum/bloc/movie/movie_state.dart';
import 'package:phelum/screens/movie_detail.dart';
import 'package:phelum/screens/profile.dart';
import 'package:phelum/widgets/movie_card.dart';

import '../colors.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();

  void _gotoDetails(BuildContext context, int itemId) async {
    await Navigator.pushNamed(context, MovieDetail.routeName, arguments: itemId);
  }

  void _gotoProfile(BuildContext context) async {
    await Navigator.pushNamed(context, ProfileScreen.routeName);
  }

  Widget _getMoviePages(MoviesLoaded state) => PageView.builder(
        controller: PageController(initialPage: 0, viewportFraction: 0.8),
        itemCount: state.movies.body.length,
        itemBuilder: (context, index) {
          return MovieCard(
            dashboardItem: state.movies.body.elementAt(index),
            onPageClicked: (id) {
              _gotoDetails(context, id);
            },
          );
        },
      );
}

class DashboardState extends State<Dashboard> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieBloc>(context)..dispatch(LoadDashboardItems());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MoviesLoading) {
          return Container(
            color: wetasphalt,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is MoviesNotLoaded) {
          return Center(
            child: Text('failed to load movies'),
          );
        }
        if (state is MoviesLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Now showing'),
              backgroundColor: wetasphalt,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    widget._gotoProfile(context);
                  },
                )
              ],
            ),
            body: Container(
              color: wetasphalt,
              child: widget._getMoviePages(state),
            ),
          );
        }
      },
    );
  }
}
