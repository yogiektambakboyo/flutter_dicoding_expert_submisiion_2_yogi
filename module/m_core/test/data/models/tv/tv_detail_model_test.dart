import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:m_core/src/data/models/genre_model.dart';
import 'package:m_core/src/data/models/tv/tv_detail_model.dart';
import 'package:m_core/src/data/models/tv/tv_season_model.dart';

void main() {
  const genre = [GenreModel(id : 1, name: "Sci-Fi & Fantasy")];
  const testTVDetailResponse = TVDetailResponse(
      nextEpisodeToAir: null,
      backdropPath : "/xAKMj134XHQVNHLC6rWsccLMenG.jpg",
      episodeRunTime: [46],
      firstAirDate: null,
      genres: genre,
      homepage: "https://www.syfy.com/chucky",
      id: 1,
      inProduction: true,
      languages: ["en"],
      lastAirDate: null,
      name: "Chucky",
      numberOfEpisodes: 8,
      numberOfSeasons: 2,
      originCountry: ["US"],
      originalLanguage: "en",
      originalName: "Chucky",
      overview: "After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.",
      popularity: 3450.651,
      posterPath: "/iF8ai2QLNiHV4anwY1TuSGZXqfN.jpg",
      seasons: [
      SeasonModel(
          airDate: null,
          episodeCount: 8,
          id: 126146,
          name : "Season 1",
          overview: "",
          posterPath: "/iF8ai2QLNiHV4anwY1TuSGZXqfN.jpg",
          seasonNumber: 1
      )
      ],
      status: "Returning Series",
      tagline: "A classic coming of rage story.",
      type: "Scripted",
      voteAverage: 8.0,
      voteCount: 2559
  );

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = testTVDetailResponse.toJson();
      // assert
      final expectedJsonMap = {
        "backdrop_path": "/xAKMj134XHQVNHLC6rWsccLMenG.jpg",
        "episode_run_time": [
          46
        ],
        "first_air_date": null,
        "genres": [
          {
            "id": 1,
            "name": "Sci-Fi & Fantasy"
          }
        ],
        "homepage": "https://www.syfy.com/chucky",
        "id": 1,
        "in_production": true,
        "languages": [
          "en"
        ],
        "last_air_date": null,
        "name": "Chucky",
        "next_episode_to_air": null,
        "number_of_episodes": 8,
        "number_of_seasons": 2,
        "origin_country": [
          "US"
        ],
        "original_language": "en",
        "original_name": "Chucky",
        "overview": "After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.",
        "popularity": 3450.651,
        "poster_path": "/iF8ai2QLNiHV4anwY1TuSGZXqfN.jpg",
        "seasons": [
          {
            "air_date": null,
            "episode_count": 8,
            "id": 126146,
            "name": "Season 1",
            "overview": "",
            "poster_path": "/iF8ai2QLNiHV4anwY1TuSGZXqfN.jpg",
            "season_number": 1
          }
        ],
        "status": "Returning Series",
        "tagline": "A classic coming of rage story.",
        "type": "Scripted",
        "vote_average": 8.0,
        "vote_count": 2559
      };
      expect(expectedJsonMap.length, result.length);
    });
  });
}
