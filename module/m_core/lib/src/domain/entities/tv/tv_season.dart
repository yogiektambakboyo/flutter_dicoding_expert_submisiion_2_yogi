import 'package:equatable/equatable.dart';

class Season extends Equatable {
  const Season({
    this.airDate,
    this.episodeCount = 0,
    this.id = 0,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber = 0,
  });

  final DateTime? airDate;
  final int episodeCount;
  final int id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int seasonNumber;

  @override
  List<Object?> get props {
    return [
      airDate,
      episodeCount,
      id,
      name,
      overview,
      posterPath,
      seasonNumber,
    ];
  }


}
