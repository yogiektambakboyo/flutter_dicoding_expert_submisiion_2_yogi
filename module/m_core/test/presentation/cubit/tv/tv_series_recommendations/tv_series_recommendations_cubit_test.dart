import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:m_core/src/data/models/tv/tv_detail_model.dart';
import 'package:m_core/src/data/models/tv/tv_model.dart';
import 'package:m_core/src/domain/usecases/tv/get_recommendation_tv_series.dart';
import 'package:m_core/src/presentation/cubit/tv/tv_series_recommendations_cbt.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_series_recommendations_cubit_test.mocks.dart';

@GenerateMocks([GetRecommendationTVSeries])
void main() {
  late TVSeriesRecommendationsCbt cubit;
  late MockGetRecommendationTVSeries mockGetRecommendationTVSeries;

  setUp(() {
    mockGetRecommendationTVSeries = MockGetRecommendationTVSeries();
    cubit = TVSeriesRecommendationsCbt(getRecommendationTVSeries: mockGetRecommendationTVSeries);
  });

  tearDown(() async {
    await cubit.close();
  });

  group(
    'TV Series Recommendations ',
    () {
      final mockTVDetail = TVDetailResponse.fromJson(jsonDetailTV).toEntity();
      final mockListTV =
          jsonListRecommendationTV.map((e) => TVModel.fromJson(e).toEntity()).toList();
      blocTest<TVSeriesRecommendationsCbt, TVSeriesRecommendationsState>(
        'should emitsInOrder [Loading, Loaded] when success',
        build: () {
          when(mockGetRecommendationTVSeries.execute(mockTVDetail.id))
              .thenAnswer((_) async => Right(mockListTV));
          return cubit;
        },
        act: (bloc) => bloc.get(mockTVDetail.id),
        expect: () => [
          const TVSeriesRecommendationsLoadingState(),
          TVSeriesRecommendationsLoadedState(items: mockListTV),
        ],
      );

      blocTest<TVSeriesRecommendationsCbt, TVSeriesRecommendationsState>(
        'should emitsInOrder [Loading, Error] when unsuccess',
        build: () {
          when(mockGetRecommendationTVSeries.execute(mockTVDetail.id))
              .thenAnswer((_) async => const Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(mockTVDetail.id),
        expect: () => [
          const TVSeriesRecommendationsLoadingState(),
          const TVSeriesRecommendationsErrorState('error'),
        ],
      );
    },
  );
}
