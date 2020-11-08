import 'package:json_annotation/json_annotation.dart';

import 'MovieModelResult.dart';

@JsonSerializable()
class MovieModel{
  int page;
  int totalResults;
  int totalPages;
  MovieModelResults results;

  MovieModel(page, totalResults, totalPages, results){
    this.page = page;
    this.totalResults = totalResults;
    this.totalPages = totalPages;
    this.results = results;
  }
}

