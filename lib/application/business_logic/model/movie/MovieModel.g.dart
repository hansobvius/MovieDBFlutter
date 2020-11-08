// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['page'] as int,
    json['totalResults'] as int,
    json['totalPages'] as int,
    json['results'] == null
        ? null
        : MovieModelResults.fromJson(json['results'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalResults': instance.totalResults,
      'totalPages': instance.totalPages,
      'results': instance.results?.toJson(),
    };
