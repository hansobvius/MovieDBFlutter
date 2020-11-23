import 'package:flutter/widgets.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/service/ServiceApi.dart';

class MovieViewModel extends ChangeNotifier{

  final categories = ["popular", "top_rated", "upcoming"];

  Future<List<MovieModel>> _movieModel = new Future<List<MovieModel>>(null);
  Future<List<MovieModel>> get movieModel => _movieModel;

  // FIXME - to resolve
  Future<List<MovieModel>> getMovieService() async {
    List<MovieModel> movie;
    categories.forEach((element) {
      serviceApi(element).then((value) =>
        movie.add(value)
      );
    });
    return movieModel;
  }

  Future<MovieModel> getService() => serviceApi("popular");

  void printValue() {
    movieModel.then((value) =>
        value.forEach((element) {
          element.results.forEach((result) {
            print("Response: ${element.results}");
          });
        })
    );
  }

}