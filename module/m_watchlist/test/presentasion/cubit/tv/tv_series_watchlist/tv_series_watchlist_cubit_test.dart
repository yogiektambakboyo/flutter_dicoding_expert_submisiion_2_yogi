import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:m_core/src/data/models/tv/tv_model.dart';
import 'package:m_watchlist/m_watchlist.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_series_watchlist_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlistTVSeries])
void main() {
  late TVSeriesWatchlistCbt cubit;
  late MockGetWatchlistTVSeries mockGetWatchlistTVSeries;
  setUp(() {
    mockGetWatchlistTVSeries = MockGetWatchlistTVSeries();
    cubit = TVSeriesWatchlistCbt(getWatchlistTVSeries: mockGetWatchlistTVSeries);
  });

  tearDown(() async {
    await cubit.close();
  });

  group('TV Series Watchlist', () {
    final mockListTV = jsonListSearchTV.map((e) => TVModel.fromJson(e).toEntity()).toList();

    blocTest<TVSeriesWatchlistCbt, TVSeriesWatchlistState>(
      'should emitsInOrder [Loading, Loaded] when success',
      build: () {
        when(mockGetWatchlistTVSeries.execute()).thenAnswer((_) async => Right(mockListTV));
        return cubit;
      },
      act: (bloc) => bloc.get(),
      expect: () => [
        const TVSeriesWatchlistLoadingState(),
        TVSeriesWatchlistLoadedState(items: mockListTV),
      ],
    );

    blocTest<TVSeriesWatchlistCbt, TVSeriesWatchlistState>(
      'should emitsInOrder [Loading, Error] when unsuccess',
      build: () {
        when(mockGetWatchlistTVSeries.execute()).thenAnswer(
          (_) async => const Left(ServerFailure('error')),
        );
        return cubit;
      },
      act: (bloc) => bloc.get(),
      expect: () => [
        const TVSeriesWatchlistLoadingState(),
        const TVSeriesWatchlistErrorState('error'),
      ],
    );
  });
}
