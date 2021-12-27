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

  @override
  bool get stringify => true;

  TVDetail copyWith({
    String? backdropPath,
    List<int>? episodeRunTime,
    DateTime? firstAirDate,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    DateTime? lastAirDate,
    String? name,
    Map<String, dynamic>? nextEpisodeToAir,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
    List<Genre>? genres,
    List<Season>? seasons,
  }) {
    return TVDetail(
      backdropPath: backdropPath ?? this.backdropPath,
      episodeRunTime: episodeRunTime ?? this.episodeRunTime,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      inProduction: inProduction ?? this.inProduction,
      languages: languages ?? this.languages,
      lastAirDate: lastAirDate ?? this.lastAirDate,
      name: name ?? this.name,
      nextEpisodeToAir: nextEpisodeToAir ?? this.nextEpisodeToAir,
      numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
      numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      type: type ?? this.type,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      genres: genres ?? this.genres,
      seasons: seasons ?? this.seasons,
    );
  }
}
