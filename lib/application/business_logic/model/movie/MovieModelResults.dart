import 'package:json_annotation/json_annotation.dart';

part 'MovieModelResults.g.dart';

@JsonSerializable()
class MovieModelResults{
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  MovieModelResults({
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.posterPath,
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate});

  factory MovieModelResults.fromJson(Map<String, dynamic> json) => _$MovieModelResultsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelResultsToJson(this);
}