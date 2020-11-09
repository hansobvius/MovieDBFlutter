// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['page'] as int,
    json['total_results'] as int,
    json['total_pages'] as int,
    (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : MovieModelResults.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.total_results,
      'total_pages': instance.total_pages,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };
