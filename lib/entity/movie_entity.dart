import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String posterPortrait;
  final String posterLandscape;
  final double rating;
  final int runtime;
  final String releaseDate;
  final String pRating;

  MovieEntity(this.title, this.posterPortrait, this.posterLandscape, this.rating,
      this.runtime, this.releaseDate, this.pRating);

  Map<String, Object> toJson() {
    return {
      'title': title,
      'poster_portrait': posterPortrait,
      'poster_landscape': posterLandscape,
      'rating': rating,
      'runtime': runtime,
      'release_date': releaseDate,
      'p_rating': pRating
    };
  }

  @override
  String toString() {
    return 'MovieEntity {title : $title, poster_portrait : $posterPortrait, poster_landscape : $posterLandscape, rating : $rating, runtime : $runtime, release_date : $releaseDate, p_rating : $pRating}';
  }

  static MovieEntity fromJson(Map<String, Object> json){
    return MovieEntity(
      json['title'] as String, 
      json['poster_portrait'] as String, 
      json['poster_landscape'] as String, 
      json['rating'] as double, 
      json['runtime'] as int, 
      json['release_date'] as String, 
      json['p_rating'] as String);
  }
}