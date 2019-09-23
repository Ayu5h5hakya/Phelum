import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:phelum/data/firebase_movie_repository.dart';
import 'package:phelum/data/repository.dart';
import 'package:test/test.dart';

class MoviesMockClient extends Mock implements Client {}

main() {
  group('fetchMovies', () {
    test('returns a ParsedReponse if http call completes successfully',
        () async {
      final client = MoviesMockClient();
      final firebaseMoviesRepository = FirebaseMovieRepository(client: client);
      when(client
              .get('https://coviva-6c25f.firebaseio.com/phelum/dashboard.json'))
          .thenAnswer((_) async => Response(
              '[{"image_url" : "https://m.media-amazon.com/images/M/MV5BMTcyNjU1MjQ3MF5BMl5BanBnXkFtZTgwNTk1MDA4NzM@._V1_.jpg","item_id" : 0,"rating" : 8.8,"title" : "Joker"}]',
              200));

      expect(await firebaseMoviesRepository.movies(),
          TypeMatcher<ParsedMoviesReponse>());
    });

    test('throws an exception if the http call completes unsuccessfully',
        () async {
      final client = MoviesMockClient();
      final firebaseMoviesRepository = FirebaseMovieRepository(client: client);
      when(client
              .get('https://coviva-6c25f.firebaseio.com/phelum/dashboard.json'))
          .thenAnswer((_) async => Response(
              'Not found',
              404));
      expect(await firebaseMoviesRepository.movies(), TypeMatcher<Exception>());
    });
  });
}
