
import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:m_search/domain/usecase/tv/search_tv_series.dart';
import 'package:m_search/presentation/cubit/tv/tv_series_search_cbt.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_series_search_cubit_test.mocks.dart';

@GenerateMocks([SearchTVSeries])
void main() {
  late MockSearchTVSeries mockSearchTVSeries;
  late TVSeriesSearchCbt cubit;
  setUp(() {
    mockSearchTVSeries = MockSearchTVSeries();
    cubit = TVSeriesSearchCbt(searchTVSeries: mockSearchTVSeries);
  });

  tearDown(() async {
    await cubit.close();
  });

  final tTVModel = TV(
      backdropPath: "/1Ep6YHL5QcrNC1JN6RYalWRPopi.jpg",
      firstAirDate: "2019-07-05",
      genreIds: [
        1, 2
      ],
      id: 1,
      name: "Dr. Stone",
      originCountry: ["JP"],
      originalLanguage: "ja",
      originalName: "ドクターストーン",
      overview : "One fateful day, all of humanity was petrified by a blinding flash of light. After several millennia, high schooler Taiju awakens and finds himself lost in a world of statues. However, he's not alone! His science-loving friend Senku's been up and running for a few months and he's got a grand plan in mind, to kickstart civilization with the power of science!",
      popularity : 16.927,
      posterPath : "/dLlnzbDCblBXcJqFLXyvN43NIwp.jpg",
      voteAverage : 8.8,
      voteCount: 927
  );

  final tTVList = <TV>[tTVModel];

  group(
    'TV Series Search',
    () {
      const query = 'Dr Stone';

      blocTest<TVSeriesSearchCbt, TVSeriesSearchState>(
        'should emitsInOrder [Loading, Loaded] when success',
        build: () {
          when(mockSearchTVSeries.execute(query)).thenAnswer((_) async => Right(tTVList));
          return cubit;
        },
        act: (bloc) => bloc.get(query),
        expect: () => [
          const TVSeriesSearchLoadingState(),
          TVSeriesSearchLoadedState(items: tTVList),
        ],
      );

      blocTest<TVSeriesSearchCbt, TVSeriesSearchState>(
        'should emitsInOrder [Loading, Error] when unsuccess',
        build: () {
          when(mockSearchTVSeries.execute(query))
              .thenAnswer((_) async => const Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(query),
        expect: () => [
          const TVSeriesSearchLoadingState(),
          const TVSeriesSearchErrorState('error'),
        ],
      );
    },
  );
}
