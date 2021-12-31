import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:m_core/src/data/models/tv/tv_model.dart';
import 'package:m_core/src/domain/usecases/tv/get_on_the_air_tv_series.dart';
import 'package:m_core/src/presentation/cubit/tv/tv_series_on_the_air_cbt.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_series_on_the_air_cubit_test.mocks.dart';

@GenerateMocks([GetOnTheAirTVSeries])
void main() {
  late MockGetOnTheAirTVSeries mockGetOnTheAirTVSeries;
  late TVSeriesOnTheAirCbt cubit;
  setUp(
    () {
      mockGetOnTheAirTVSeries = MockGetOnTheAirTVSeries();
      cubit = TVSeriesOnTheAirCbt(getOnTheAirTVSeries: mockGetOnTheAirTVSeries);
    },
  );

  tearDown(() async {
    await cubit.close();
  });

  group(
    'TV Series On The Air',
    () {
      final mockListTV = jsonListSearchTV
          .map(
            (e) => TVModel.fromJson(Map<String, dynamic>.from(e as Map)).toEntity(),
          )
          .toList();

      blocTest<TVSeriesOnTheAirCbt, TVSeriesOnTheAirState>(
        'should emitsInOrder [Loading, Loaded] when successfull',
        build: () {
          when(mockGetOnTheAirTVSeries.execute()).thenAnswer((_) async => Right(mockListTV));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const TVSeriesOnTheAirLoading(),
          TVSeriesOnTheAirLoaded(items: mockListTV),
        ],
      );

      blocTest<TVSeriesOnTheAirCbt, TVSeriesOnTheAirState>(
        'should emitsInOrder [Loading, Error] when unsuccessfull',
        build: () {
          when(mockGetOnTheAirTVSeries.execute())
              .thenAnswer((_) async => const Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const TVSeriesOnTheAirLoading(),
          const TVSeriesOnTheAirError('error'),
        ],
      );
    },
  );
}
