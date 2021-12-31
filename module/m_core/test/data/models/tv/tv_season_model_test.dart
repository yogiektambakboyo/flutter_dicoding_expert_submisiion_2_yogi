import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:m_core/src/data/models/genre_model.dart';
import 'package:m_core/src/data/models/tv/tv_detail_model.dart';
import 'package:m_core/src/data/models/tv/tv_episode_model.dart';
import 'package:m_core/src/data/models/tv/tv_local_database_model.dart';
import 'package:m_core/src/data/models/tv/tv_season_model.dart';

void main() {
  const testTVLocalDatabaseModel = SeasonModel(
    airDate: null,
    episodeCount: 1,
    id: 1,
    name: "name",
    overview: "overview",
    posterPath: "posterPath",
    seasonNumber: 1,
  );

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = testTVLocalDatabaseModel.toJson();
      // assert
      final expectedJsonMap = {
        "air_date": null,
        "episode_count": 1,
        "id": 1,
        "name": "name",
        "overview": "overview",
        "poster_path": "posterPath",
        "season_number": 1,
      };
      expect(expectedJsonMap, result);
    });
  });
}
