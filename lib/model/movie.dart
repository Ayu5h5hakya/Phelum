import 'package:meta/meta.dart';
import '../entity/movie_entity.dart';

@immutable
class Movie {
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

  Movie(
      {this.title,
      this.synopsis,
      this.posterPortrait,
      this.posterLandscape,
      this.rating,
      this.runtime,
      this.releaseDate,
      this.pRating,
      this.genre,
      this.director,
      this.budget,
      this.location,
      this.ratio});

  Movie copyWith(
      {String title,
      String synopsis,
      String posterPortrait,
      String posterLandscape,
      int rating,
      int runtime,
      String releaseDate,
      String pRating,
      String director, 
      String budget,
      String location,
      String ratio}) {
    return Movie(
        title: title ?? this.title,
        synopsis: synopsis ?? this.synopsis,
        posterPortrait: posterPortrait ?? this.posterPortrait,
        posterLandscape: posterLandscape ?? this.posterLandscape,
        rating: rating ?? this.rating,
        runtime: runtime ?? this.runtime,
        releaseDate: releaseDate ?? this.releaseDate,
        pRating: pRating ?? this.pRating,
        genre: genre ?? this.genre,
        director: this.director,
        budget: this.budget,
        location: this.location,
        ratio: this.ratio);
  }

  @override
  String toString() {
    return 'MovieEntity {title : $title, synopsis : $synopsis, poster_portrait : $posterPortrait, poster_landscape : $posterLandscape, rating : $rating, runtime : $runtime, release_date : $releaseDate, p_rating : $pRating, genres : $genre, director : $director, budget : $budget, location : $location, ratio : $ratio}';
  }

  MovieEntity toEntity() {
    return MovieEntity(title, synopsis, posterPortrait, posterLandscape, rating,
        genre, runtime, releaseDate, pRating, director, budget, location, ratio);
  }

  static Movie fromEntity(MovieEntity entity) {
    return Movie(
        title: entity.title,
        synopsis: entity.synopsis,
        posterPortrait: entity.posterPortrait,
        posterLandscape: entity.posterLandscape,
        rating: entity.rating,
        runtime: entity.runtime,
        releaseDate: entity.releaseDate,
        pRating: entity.pRating,
        genre: entity.genre,
        director: entity.director,
        budget: entity.budget,
        location: entity.location,
        ratio: entity.ratio);
  }

  factory Movie.empty() {
    return Movie(
        title: "",
        synopsis: "",
        posterLandscape: "",
        posterPortrait: "",
        pRating: "",
        rating: 0,
        releaseDate: "",
        runtime: 0,
        genre: [],
        director: "",
        budget: "",
        location: "",
        ratio: "");
  }
}
