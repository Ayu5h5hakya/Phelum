import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/detail/detail_bloc.dart';
import 'package:phelum/bloc/detail/detail_event.dart';
import 'package:phelum/bloc/detail/detail_state.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/model/booking.dart';
import 'package:phelum/model/movie.dart';
import 'package:phelum/screens/cinema_location.dart';
import 'package:phelum/widgets/genre_tag.dart';
import 'package:phelum/widgets/rating.dart';
import 'package:phelum/widgets/switch_meta_info.dart';
import 'package:phelum/widgets/synopsis_view.dart';

class MovieDetail extends StatefulWidget {
  static const routeName = '/movie_detail';
  final int movie_id;

  MovieDetail({this.movie_id});

  @override
  State<StatefulWidget> createState() => MovieDetailState();
}

class MovieDetailState extends State<MovieDetail> {
  DetailBloc detailBloc;
  @override
  void initState() {
    super.initState();
    detailBloc = BlocProvider.of<DetailBloc>(context);
    detailBloc.dispatch(LoadMovieDetails(movieId: widget.movie_id));
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            color: wetasphalt,
          ),
          BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              if (state is DetailLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is MovieDetailLoaded) {
                return _displayMovieDetails(context, state.movieDetail.body);
              }
              if (state is DetailsNotLoaded) {
                return Text('err');
              }
            },
          )
        ],
      );

  void _gotoCinemaLocation(BuildContext context, Booking booking) async {
    await Navigator.pushNamed(context, CinemaLocation.routeName,
        arguments: booking);
  }

  Widget _displayMovieDetails(BuildContext context, Movie movie) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: false,
                pinned: true,
                expandedHeight: 150,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(movie.title),
                  background: Image.network(
                    movie.posterLandscape,
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
                SynopsisWidget(value: movie.synopsis),
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.genre.length,
                    itemBuilder: (context, index) {
                      return GenreTag(tagName: movie.genre.elementAt(index));
                    },
                  ),
                ),
                Container(
                  color: midnightblue,
                  padding: EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RatingWidget(
                        rating: movie.rating,
                      ),
                      Text(
                        movie.pRating,
                        style: TextStyle(fontSize: 40),
                      )
                    ],
                  ),
                ),
                SwitchableMetaInformation(
                    director: movie.director,
                    budget: movie.budget,
                    location: movie.location,
                    ratio: movie.ratio)
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.event_seat),
          onPressed: () {
            _gotoCinemaLocation(
                context,
                Booking(
                    movieId: widget.movie_id,
                    movieName: movie.title,
                    moviePoster: movie.posterLandscape,
                    rating: movie.rating,
                    movieGenre: movie.genre.fold("", (previous, current) {
                      if (previous.isEmpty)
                        return current;
                      else
                        return previous + "|" + current;
                    })));
          },
        ),
      );
}
