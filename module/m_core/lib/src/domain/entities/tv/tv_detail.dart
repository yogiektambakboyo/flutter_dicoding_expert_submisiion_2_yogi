import 'package:equatable/equatable.dart';

import '../genre.dart';
import 'tv_season.dart';

class TVDetail extends Equatable {
  const TVDetail({
    this.backdropPath,
    this.episodeRunTime = const [],
    this.firstAirDate,
    this.homepage,
    this.id = 0,
    this.inProduction = false,
    this.languages = const [],
    this.lastAirDate,
    this.name = '',
    this.nextEpisodeToAir,
    this.numberOfEpisodes = 0,
    this.numberOfSeasons = 0,
    this.originCountry = const [],
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity = 0.0,
    this.posterPath,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage = 0,
    this.voteCount = 0,
    this.genres = const [],
    this.seasons = const [],
  });

  final String? backdropPath;
  final List<int> episodeRunTime;
  final DateTime? firstAirDate;
  final String? homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final DateTime? lastAirDate;
  final String name;
  final Map<String, dynamic>? nextEpisodeToAir;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final String? status;
  final String? tagline;
  final String? type;
  final double voteAverage;
  final int voteCount;
  final List<Genre> genres;
  final List<Season> seasons;

  @override
  List<Object?> get props {
    return [
      backdropPath,
      episodeRunTime,
      firstAirDate,
      homepage,
      id,
      inProduction,
      languages,
      lastAirDate,
      name,
      nextEpisodeToAir,
      numberOfEpisodes,
      numberOfSeasons,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      status,
      tagline,
      type,
      voteAverage,
      voteCount,
      genres,
      seasons,
    ];
  }
}
