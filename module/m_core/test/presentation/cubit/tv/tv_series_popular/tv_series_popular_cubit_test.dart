import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:m_core/src/data/models/tv/tv_model.dart';
import 'package:m_core/src/domain/usecases/tv/get_popular_tv_series.dart';
import 'package:m_core/src/presentation/cubit/tv/tv_series_popular_cbt.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_series_popular_cubit_test.mocks.dart';

@GenerateMocks([GetPopularTVSeries])
void main() {
  late MockGetPopularTVSeries mockGetPopularTVSeries;
  late TVSeriesPopularCbt cubit;
  setUp(
    () {
      mockGetPopularTVSeries = MockGetPopularTVSeries();
      cubit = TVSeriesPopularCbt(getPopularTVSeries: mockGetPopularTVSeries);
    },
  );

  tearDown(() async {
    await cubit.close();
  });

  group(
    'TV Series Popular',
    () {
      final mockListTV = jsonListSearchTV
          .map(
            (e) => TVModel.fromJson(Map<String, dynamic>.from(e as Map)).toEntity(),
          )
          .toList();

      blocTest<TVSeriesPopularCbt, TVSeriesPopularState>(
        'should emitsInOrder [Loading, Loaded] when successfull',
        build: () {
          when(mockGetPopularTVSeries.execute()).thenAnswer((_) async => Right(mockListTV));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const TVSeriesPopularLoadingState(),
          TVSeriesPopularLoadedState(items: mockListTV),
        ],
      );

      blocTest<TVSeriesPopularCbt, TVSeriesPopularState>(
        'should emitsInOrder [Loading, Error] when unsuccessfull',
        build: () {
          when(mockGetPopularTVSeries.execute())
              .thenAnswer((_) async => const Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const TVSeriesPopularLoadingState(),
          const TVSeriesPopularErrorState('error'),
        ],
      );
    },
  );
}
