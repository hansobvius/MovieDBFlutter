// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieModelResults.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModelResults _$MovieModelResultsFromJson(Map<String, dynamic> json) {
  return MovieModelResults(
    (json['popularity'] as num)?.toDouble(),
    json['voteCount'] as int,
    json['video'] as bool,
    json['posterPath'] as String,
    json['id'] as int,
    json['adult'] as bool,
    json['backdropPath'] as String,
    json['originalLanguage'] as String,
    json['originalTitle'] as String,
    json['title'] as String,
    (json['voteAverage'] as num)?.toDouble(),
    json['overview'] as String,
    json['releaseDate'] as String,
  );
}

Map<String, dynamic> _$MovieModelResultsToJson(MovieModelResults instance) =>
    <String, dynamic>{
      'popularity': instance.popularity,
      'voteCount': instance.voteCount,
      'video': instance.video,
      'posterPath': instance.posterPath,
      'id': instance.id,
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'title': instance.title,
      'voteAverage': instance.voteAverage,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate,
    };
