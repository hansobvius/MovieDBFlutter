import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/service/ServiceApi.dart';

class MovieViewModel extends ChangeNotifier{

  final categories = ["popular", "top_rated", "upcoming"];

  Future<List<MovieModel>> _movieModel = Future<List<MovieModel>>(null);
  Future<List<MovieModel>> get movieModel => _movieModel;

  // FIXME - to resolve
  Future<List<Future<MovieModel>>> getMovieService() async {
    List<Future<MovieModel>> futureList = categories.map((url) async {
      return await compute(serviceApi, url).then((items) => items);
    });
    return futureList;
  }

  Future<MovieModel> getService() async => await serviceApi("popular");

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