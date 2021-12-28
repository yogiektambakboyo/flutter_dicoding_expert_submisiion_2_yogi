import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:m_core/src/domain/usecases/get_popular_movies.dart';
import 'package:m_core/src/presentation/cubit/movie/movie_popular_cbt.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_popular_cubit_test.mocks.dart';

@GenerateMocks([
  GetPopularMovies,
])
void main() {
  late MockGetPopularMovies mockGetPopularMovies;
  late MoviePopularCbt cubit;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    cubit = MoviePopularCbt(getPopularMovies: mockGetPopularMovies);
  });

  tearDown(() async {
    await cubit.close();
  });

  group(
    'Movie Popular',
    () {
      blocTest<MoviePopularCbt, MoviePopularState>(
        'Should emitsInOrder [Loading, Loaded] when success',
        build: () {
          when(mockGetPopularMovies.execute()).thenAnswer((_) async => Right(testMovieList));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const MoviePopularLoadingState(),
          MoviePopularLoadedState(items: testMovieList),
        ],
      );

      blocTest<MoviePopularCbt, MoviePopularState>(
        'Should emitsInOrder [Loading, Loaded] when unsuccess',
        build: () {
          when(mockGetPopularMovies.execute())
              .thenAnswer((_) async => const Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const MoviePopularLoadingState(),
          const MoviePopularErrorState('error'),
        ],
      );
    },
  );
}
