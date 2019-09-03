import 'package:meta/meta.dart';
import '../entity/movie_entity.dart';

@immutable
class Movie {
  final String title;
  final String posterPortrait;
  final String posterLandscape;
  final double rating;
  final int runtime;
  final String releaseDate;
  final String pRating;

  Movie(this.title, this.posterPortrait, this.posterLandscape, this.rating,
      this.runtime, this.releaseDate, this.pRating);

  Movie copyWith({String title, String posterPortrait, String posterLandscape, int rating,
      int runtime, String releaseDate, String pRating}) {
    return Movie(
      title ?? this.title,
      posterPortrait ?? this.posterPortrait,
      posterLandscape ?? this.posterLandscape,
      rating ?? this.rating,
      runtime ?? this.runtime,
      releaseDate ?? this.releaseDate,
      pRating ?? this.pRating
    );
  }

  @override
  String toString() {
    return 'MovieEntity {title : $title, poster_portrait : $posterPortrait, poster_landscape : $posterLandscape, rating : $rating, runtime : $runtime, release_date : $releaseDate, p_rating : $pRating}';
  }

  MovieEntity toEntity() {
    return MovieEntity(title, posterPortrait, posterLandscape, rating, runtime, releaseDate, pRating);
  }

  static Movie fromEntity(MovieEntity entity) {
    return Movie(
      entity.title,
      entity.posterPortrait,
      entity.posterLandscape,
      entity.rating,
      entity.runtime,
      entity.releaseDate,
      entity.pRating
    );
  }
}