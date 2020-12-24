// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieModelResults.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModelResults _$MovieModelResultsFromJson(Map<String, dynamic> json) {
  return MovieModelResults(
    (json['popularity'] as num)?.toDouble(),
    json['vote_count'] as int,
    json['video'] as bool,
    json['poster_path'] as String,
    json['id'] as int,
    json['adult'] as bool,
    json['backdrop_path'] as String,
    json['original_language'] as String,
    json['original_title'] as String,
    json['title'] as String,
    (json['vote_average'] as num)?.toDouble(),
    json['overview'] as String,
    json['release_date'] as String,
  );
}

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

bool convertIntegerToBoolean(int value){
  bool buffer;
  switch(value){
    case 0:{
      buffer = false;
      break;
    }
    case 1:
      buffer = true;
      break;
  }
  return buffer;
}
