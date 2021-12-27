import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:m_core/src/domain/entities/tv/tv.dart';
import 'package:m_search/m_search.dart';

import 'search_tv_series_test.mocks.dart';

@GenerateMocks([TVRepository])
void main() {
  late MockTVRepository repository;
  late SearchTVSeries usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = SearchTVSeries(repository: repository);
  });

  const query = "Dr Stone";
  const list = <TV>[];
  test('should get list of TV Series from repository', () async {
    when(repository.searchTVSeries(query)).thenAnswer((_) async => const Right(list));
    final result = await usecase.execute(query);
    expect(result, const Right(list));
  });
}
