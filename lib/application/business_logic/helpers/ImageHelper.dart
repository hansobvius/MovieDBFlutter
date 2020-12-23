import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'dart:math';

String getImage(String path) => "http://image.tmdb.org/t/p/w500${path}";

String getRandomImage(List<MovieModel> movieModelList){
  String posterPath = movieModelList[Random().nextInt(movieModelList.length)]
      .results[Random().nextInt(20 - 1)].backdrop_path;
  return posterPath;
}
