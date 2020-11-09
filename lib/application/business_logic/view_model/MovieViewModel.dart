import 'package:flutter/widgets.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/service/ServiceApi.dart';

class MovieViewModel extends ChangeNotifier{

  Future<MovieModel> _movieModel;
  Future<MovieModel> get movieModel => _movieModel;

  Future<MovieModel> getMovieService(){
    _movieModel = serviceApi();
    return movieModel;
  }

  Future<MovieModel> getService() => serviceApi();

  void printValue(){
    print("${movieModel.then((value) => value.total_results)}");
  }
}