import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:m_core/src/data/models/genre_model.dart';

import 'package:m_core/src/data/models/movie_model.dart';
import 'package:m_core/src/data/models/movie_response.dart';
import 'package:m_core/src/data/models/movie_table.dart';

import '../../json_reader.dart';

void main() {
  const testGenreModel = GenreModel(
    id: 1,
    name: 'name',
  );

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = testGenreModel.toJson();
      // assert
      final expectedJsonMap = {
        'id': 1,
        'name': 'name',
      };
      expect(result, expectedJsonMap);
    });
  });
}
