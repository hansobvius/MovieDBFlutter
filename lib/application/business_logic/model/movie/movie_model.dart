import 'package:json_annotation/json_annotation.dart';
import 'movie_model_results.dart';

part 'movie_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieModel{
  int page;
  int totalResults;
  int totalPages;
  List<MovieModelResults> results;

  MovieModel(this.page, this.totalResults, this.totalPages, this.results);

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

