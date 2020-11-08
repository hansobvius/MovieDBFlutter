import 'package:flutter/widgets.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/service/ServiceApi.dart';

class MovieViewModel extends ChangeNotifier{

  Future<MovieModel> _movieModel;
  Future<MovieModel> get movieModel => _movieModel;

  void getMovieService(){
    _movieModel = serviceApi();
  }

  void printValue(){
    print("${movieModel.then((value) => value.totalResults)}");
  }
}