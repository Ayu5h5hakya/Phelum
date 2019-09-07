import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String synopsis;
  final String posterPortrait;
  final String posterLandscape;
  final double rating;
  final int runtime;
  final String releaseDate;
  final String pRating;
  final List<String> genre;
  final String director;
  final String budget;
  final String location;
  final String ratio;

  MovieEntity(
      this.title,
      this.synopsis,
      this.posterPortrait,
      this.posterLandscape,
      this.rating,
      this.genre,
      this.runtime,
      this.releaseDate,
      this.pRating,
      this.director,
      this.budget,
      this.location,
      this.ratio);

  Map<String, Object> toJson() {
    return {
      'title': title,
      'synopsis': synopsis,
      'poster_portrait': posterPortrait,
      'poster_landscape': posterLandscape,
      'rating': rating,
      'genre': genre,
      'runtime': runtime,
      'release_date': releaseDate,
      'p_rating': pRating,
      'director' : director,
      'budget' : budget,
      'location' : location,
      'ratio' : ratio
    };
  }

  @override
  String toString() {
    return 'MovieEntity {title : $title, synopsis : $synopsis, poster_portrait : $posterPortrait, poster_landscape : $posterLandscape, rating : $rating, genres : $genre, runtime : $runtime, release_date : $releaseDate, p_rating : $pRating, director : $director, budget : $budget, location : $location, ratio : $ratio}';
  }

  static MovieEntity fromJson(Map<String, Object> json) {
    return MovieEntity(
        json['title'] as String,
        json['synopsis'] as String,
        json['poster_portrait'] as String,
        json['poster_landscape'] as String,
        json['rating'] as double,
        List<String>.from(json['genre']),
        json['runtime'] as int,
        json['release_date'] as String,
        json['p_rating'] as String,
        json['director'] as String,
        json['budget'] as String,
        json['location'] as String,
        json['ratio'] as String);
  }
}
