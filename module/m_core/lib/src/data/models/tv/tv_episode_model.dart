import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv/tv_episode.dart';

DateTime? _validDateTimeFromJson(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  final result = DateTime.tryParse(value);
  return result;
}

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class EpisodeModel extends Equatable {
  const EpisodeModel({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  @JsonKey(fromJson: _validDateTimeFromJson)
  final DateTime? airDate;
  final int? episodeNumber;
  final int? id;
  final String? name;
  final String? overview;
  final String? productionCode;
  final int? seasonNumber;
  final String? stillPath;
  final double? voteAverage;
  final int? voteCount;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
  Episode toEntity() {
    return Episode(
      airDate: airDate,
      episodeNumber: episodeNumber,
      id: id,
      name: name,
      overview: overview,
      productionCode: productionCode,
      seasonNumber: seasonNumber,
      stillPath: stillPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  List<Object?> get props {
    return [
      airDate,
      episodeNumber,
      id,
      name,
      overview,
      productionCode,
      seasonNumber,
      stillPath,
      voteAverage,
      voteCount,
    ];
  }

  @override
  bool get stringify => true;
}

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
  airDate: _validDateTimeFromJson(json['air_date'] as String?),
  episodeNumber: json['episode_number'] as int?,
  id: json['id'] as int?,
  name: json['name'] as String?,
  overview: json['overview'] as String?,
  productionCode: json['production_code'] as String?,
  seasonNumber: json['season_number'] as int?,
  stillPath: json['still_path'] as String?,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: json['vote_count'] as int?,
);

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'air_date': instance.airDate?.toIso8601String(),
      'episode_number': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
