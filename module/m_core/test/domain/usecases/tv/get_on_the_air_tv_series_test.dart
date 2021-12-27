import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:m_core/m_core.dart';
import 'package:mockito/mockito.dart';

import 'package:m_core/src/domain/entities/tv/tv.dart';
import 'package:m_core/src/domain/usecases/tv/get_popular_tv_series.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late GetOnTheAirTVSeries usecase;
  setUp(() {
    repository = MockTVRepository();
    usecase = GetOnTheAirTVSeries(repository: repository);
  });

  final list = <TV>[];
  test(
    'should get list of on the Air tv series from the repository',
    () async {
      ///arrange
      when(repository.getOnTheAirTVSeries()).thenAnswer((_) async => Right(list));

      ///act
      final result = await usecase.execute();

      ///assert
      expect(result, Right(list));
    },
  );
}
