import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/tv/tv.dart';
import '../../../domain/entities/tv/tv_detail.dart';

@immutable
@JsonSerializable()
class TVLocalDatabaseModel extends Equatable {
  const TVLocalDatabaseModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  final int id;
  final String title;
  final String posterPath;
  final String overview;

  factory TVLocalDatabaseModel.fromJson(Map<String, dynamic> json) =>
      _$TVLocalDatabaseModelFromJson(json);

  factory TVLocalDatabaseModel.fromEntity(TVDetail tv) {
    return TVLocalDatabaseModel(
      id: tv.id,
      title: tv.name,
      posterPath: tv.posterPath ?? '',
      overview: tv.overview ?? '',
    );
  }

  Map<String, dynamic> toJson() => _$TVLocalDatabaseModelToJson(this);

  TV toEntity() => TV(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: title,
      );

  @override
  List<Object> get props => [id, title, posterPath, overview];


}


TVLocalDatabaseModel _$TVLocalDatabaseModelFromJson(
    Map<String, dynamic> json) =>
    TVLocalDatabaseModel(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['posterPath'] as String,
      overview: json['overview'] as String,
    );

Map<String, dynamic> _$TVLocalDatabaseModelToJson(
    TVLocalDatabaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'overview': instance.overview,
    };