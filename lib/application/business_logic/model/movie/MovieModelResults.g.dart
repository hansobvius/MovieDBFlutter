// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieModelResults.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModelResults _$MovieModelResultsFromJson(Map<String, dynamic> json) =>
    MovieModelResults(
      popularity: (json['popularity'] as num?)?.toDouble(),
      vote_count: json['vote_count'] as int?,
      video: json['video'] as bool?,
      poster_path: json['poster_path'] as String?,
      id: json['id'] as int?,
      adult: json['adult'] as bool?,
      backdrop_path: json['backdrop_path'] as String?,
      original_language: json['original_language'] as String?,
      original_title: json['original_title'] as String?,
      title: json['title'] as String?,
      vote_average: (json['vote_average'] as num?)?.toDouble(),
      overview: json['overview'] as String?,
      release_date: json['release_date'] as String?,
    );

Map<String, dynamic> _$MovieModelResultsToJson(MovieModelResults instance) =>
    <String, dynamic>{
      'popularity': instance.popularity,
      'vote_count': instance.vote_count,
      'video': instance.video,
      'poster_path': instance.poster_path,
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'title': instance.title,
      'vote_average': instance.vote_average,
      'overview': instance.overview,
      'release_date': instance.release_date,
    };
