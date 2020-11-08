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

  MovieModelResults(
      this.popularity,
      this.voteCount,
      this.video,
      this.posterPath,
      this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.title,
      this.voteAverage,
      this.overview,
      this.releaseDate);

  factory MovieModelResults.fromJson(Map<String, dynamic> json) => _$MovieModelResultsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelResultsToJson(this);
}