import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:m_core/src/data/models/genre_model.dart';
import 'package:m_core/src/data/models/tv/tv_detail_model.dart';
import 'package:m_core/src/data/models/tv/tv_episode_model.dart';
import 'package:m_core/src/data/models/tv/tv_local_database_model.dart';
import 'package:m_core/src/data/models/tv/tv_model.dart';
import 'package:m_core/src/data/models/tv/tv_season_model.dart';

void main() {
  const testTVModel = TVModel(
    backdropPath: "backdropPath",
    firstAirDate: "firstAirDate",
    genreIds: [1],
    id: 1,
    name: "name",
    originCountry: ["originCountry"],
    originalLanguage: "originalLanguage",
    originalName: "originalName",
    overview: "overview",
    popularity: 1,
    posterPath: "posterPath",
    voteAverage: 1,
    voteCount: 1,
  );

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = testTVModel.toJson();
      // assert
      final expectedJsonMap = {
        "backdrop_path": "backdropPath",
        "first_air_date": "firstAirDate",
        "genre_ids": [1],
        "id": 1,
        "name": "name",
        "origin_country": ["originCountry"],
        "original_language": "originalLanguage",
        "original_name": "originalName",
        "overview": "overview",
        "popularity": 1,
        "poster_path": "posterPath",
        "vote_average": 1,
        "vote_count": 1,
      };
      expect(expectedJsonMap, result);
    });
  });
}
