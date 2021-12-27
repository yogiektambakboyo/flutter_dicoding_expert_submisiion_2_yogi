import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:m_watchlist/m_watchlist.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_watchlist_cbt_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late MovieWatchlistCbt cubit;
  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    cubit = MovieWatchlistCbt(getWatchlistMovies: mockGetWatchlistMovies);
  });

  tearDown(() async {
    await cubit.close();
  });

  group(
    'Movie Watchlist',
    () {
      blocTest<MovieWatchlistCbt, MovieWatchlistState>(
        'Should emitsInOrder [Loading, Loaded] when success',
        build: () {
          when(mockGetWatchlistMovies.execute())
              .thenAnswer((realInvocation) async => Right(testMovieList));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const MovieWatchlistLoadingState(),
          MovieWatchlistLoadedState(items: testMovieList),
        ],
      );

      blocTest<MovieWatchlistCbt, MovieWatchlistState>(
        'Should emitsInOrder [Loading, Error] when success',
        build: () {
          when(mockGetWatchlistMovies.execute())
              .thenAnswer((realInvocation) async => const Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const MovieWatchlistLoadingState(),
          const MovieWatchlistErrorState('error'),
        ],
      );
    },
  );
}
