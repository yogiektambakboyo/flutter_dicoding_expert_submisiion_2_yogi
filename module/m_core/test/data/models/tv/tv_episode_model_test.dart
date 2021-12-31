import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:m_core/src/data/models/genre_model.dart';
import 'package:m_core/src/data/models/tv/tv_detail_model.dart';
import 'package:m_core/src/data/models/tv/tv_episode_model.dart';
import 'package:m_core/src/data/models/tv/tv_season_model.dart';

void main() {
  const genre = [
    GenreModel(id : 1, name: "Sci-Fi & Fantasy")
  ];
  const testTVEpisode = EpisodeModel(
    airDate: null,
    episodeNumber: 1,
    id: 1,
    name: "name",
    overview: "overview",
    productionCode: "productionCode",
    seasonNumber: 1,
    stillPath: "stillPath",
    voteAverage: 1,
    voteCount: 2,
  );

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = testTVEpisode.toJson();
      // assert
      final expectedJsonMap = {
        "air_date": null,
        "episode_number": 1,
        "id": 1,
        "name": "name",
        "overview": "overview",
        "production_code": "productionCode",
        "season_number": 1,
        "still_path": "stillPath",
        "vote_average": 1,
        "vote_count": 2,
      };
      expect(expectedJsonMap, result);
    });
  });
}
