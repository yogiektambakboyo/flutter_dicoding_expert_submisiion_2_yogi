import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/tv/tv.dart';

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
class TVModel extends Equatable {
  const TVModel({
    this.backdropPath,
    this.firstAirDate = '',
    this.genreIds = const [],
    this.id = 0,
    this.name = '',
    this.originCountry = const [],
    this.originalLanguage = '',
    this.originalName = '',
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  final String? backdropPath;
  final String firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;

  factory TVModel.fromJson(Map<String, dynamic> json) => _$TVModelFromJson(json);
  Map<String, dynamic> toJson() => _$TVModelToJson(this);
  TV toEntity() {
    return TV(
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
      genreIds: genreIds,
      id: id,
      name: name,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  List<Object?> get props {
    return [
      backdropPath,
      firstAirDate,
      genreIds,
      id,
      name,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      voteAverage,
      voteCount,
    ];
  }


}


TVModel _$TVModelFromJson(Map<String, dynamic> json) => TVModel(
  backdropPath: json['backdrop_path'] as String?,
  firstAirDate: json['first_air_date'] as String? ?? '',
  genreIds: (json['genre_ids'] as List<dynamic>?)
      ?.map((e) => e as int)
      .toList() ??
      const [],
  id: json['id'] as int? ?? 0,
  name: json['name'] as String? ?? '',
  originCountry: (json['origin_country'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList() ??
      const [],
  originalLanguage: json['original_language'] as String? ?? '',
  originalName: json['original_name'] as String? ?? '',
  overview: json['overview'] as String? ?? '',
  popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
  posterPath: json['poster_path'] as String?,
  voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
  voteCount: json['vote_count'] as int? ?? 0,
);

Map<String, dynamic> _$TVModelToJson(TVModel instance) => <String, dynamic>{
  'backdrop_path': instance.backdropPath,
  'first_air_date': instance.firstAirDate,
  'genre_ids': instance.genreIds,
  'id': instance.id,
  'name': instance.name,
  'origin_country': instance.originCountry,
  'original_language': instance.originalLanguage,
  'original_name': instance.originalName,
  'overview': instance.overview,
  'popularity': instance.popularity,
  'poster_path': instance.posterPath,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
};

