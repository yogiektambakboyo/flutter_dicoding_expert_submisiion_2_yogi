import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:m_core/src/domain/usecases/get_now_playing_movies.dart';
import 'package:m_core/src/presentation/cubit/movie/movie_now_playing_cbt.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_now_playing_cubit_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MovieNowPlayingCbt cubit;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    cubit = MovieNowPlayingCbt(
      getNowPlayingMovies: mockGetNowPlayingMovies,
    );
  });

  tearDown(() async {
    await cubit.close();
  });

  group(
    'Movie Now Playing',
    () {
      blocTest<MovieNowPlayingCbt, MovieNowPlayingState>(
        'should emitsInOrder [Loading, Loaded] when success',
        build: () {
          when(mockGetNowPlayingMovies.execute()).thenAnswer((_) async => Right(testMovieList));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const MovieNowPlayingLoadingState(),
          MovieNowPlayingLoadedState(items: testMovieList),
        ],
      );

      blocTest<MovieNowPlayingCbt, MovieNowPlayingState>(
        'should emitsInOrder [Loading, Error] when unsuccess',
        build: () {
          when(mockGetNowPlayingMovies.execute())
              .thenAnswer((_) async => const Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const MovieNowPlayingLoadingState(),
          const MovieNowPlayingErrorState('error'),
        ],
      );
    },
  );
}
