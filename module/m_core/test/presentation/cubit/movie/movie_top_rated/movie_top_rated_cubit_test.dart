import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:m_core/src/domain/usecases/get_top_rated_movies.dart';
import 'package:m_core/src/presentation/cubit/movie/movie_top_rated_cbt.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_top_rated_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MovieTopRatedCbt cubit;
  setUp(
    () {
      mockGetTopRatedMovies = MockGetTopRatedMovies();
      cubit = MovieTopRatedCbt(getTopRatedMovies: mockGetTopRatedMovies);
    },
  );

  tearDown(() async {
    await cubit.close();
  });

  group(
    'Movie Top Rated',
    () {
      blocTest<MovieTopRatedCbt, MovieTopRatedState>(
        'Should emitsInOrder [Loading, Loaded] when success',
        build: () {
          when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => Right(testMovieList));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const MovieTopRatedLoadingState(),
          MovieTopRatedLoadedState(items: testMovieList),
        ],
      );

      blocTest<MovieTopRatedCbt, MovieTopRatedState>(
        'Should emitsInOrder [Loading, Error] when unsuccess',
        build: () {
          when(mockGetTopRatedMovies.execute())
              .thenAnswer((_) async => const Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const MovieTopRatedLoadingState(),
          const MovieTopRatedErrorState('error'),
        ],
      );
    },
  );
}
