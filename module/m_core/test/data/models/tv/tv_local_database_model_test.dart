import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:m_core/src/data/models/genre_model.dart';
import 'package:m_core/src/data/models/tv/tv_detail_model.dart';
import 'package:m_core/src/data/models/tv/tv_episode_model.dart';
import 'package:m_core/src/data/models/tv/tv_local_database_model.dart';
import 'package:m_core/src/data/models/tv/tv_season_model.dart';

void main() {
  const testTVLocalDatabaseModel = TVLocalDatabaseModel(
    id: 1,
    overview: "overview",
    posterPath: "posterPath",
    title: '',
  );

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = testTVLocalDatabaseModel.toJson();
      // assert
      final expectedJsonMap = {
        "id": 1,
        "overview": "overview",
        "posterPath": "posterPath",
        "title": '',
      };
      expect(expectedJsonMap, result);
    });
  });
}
