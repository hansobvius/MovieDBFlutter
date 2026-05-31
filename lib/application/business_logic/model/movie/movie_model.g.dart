// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      json['page'] as int,
      json['totalResults'] as int,
      json['totalPages'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => MovieModelResults.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalResults': instance.totalResults,
      'totalPages': instance.totalPages,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
