import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:m_core/src/data/models/movie_model.dart';
import 'package:m_core/src/data/models/movie_response.dart';
import 'package:m_core/src/data/models/movie_table.dart';

import '../../json_reader.dart';

void main() {
  const testMovieTable = MovieTable(
    id: 1,
    title: 'title',
    posterPath: 'posterPath',
    overview: 'overview',
  );

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = testMovieTable.toJson();
      // assert
      final expectedJsonMap = {
        'id': 1,
        'overview': 'overview',
        'posterPath': 'posterPath',
        'title': 'title',
      };
      expect(result, expectedJsonMap);
    });
  });
}
