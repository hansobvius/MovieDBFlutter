import 'package:json_annotation/json_annotation.dart';
import 'MovieModelResults.dart';

part 'MovieModel.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieModel{
  int page;
  int totalResults;
  int totalPages;
  MovieModelResults results;

  MovieModel(this.page, this.totalResults, this.totalPages, this.results);

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

