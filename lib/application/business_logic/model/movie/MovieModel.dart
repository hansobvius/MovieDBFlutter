import 'package:json_annotation/json_annotation.dart';
import 'MovieModelResults.dart';

part 'MovieModel.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieModel{
  int page;
  int total_results;
  int total_pages;
  List<MovieModelResults> results;

  MovieModel(this.page, this.total_results, this.total_pages, this.results);

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

