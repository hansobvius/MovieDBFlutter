import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/service/ServiceApi.dart';

part 'MovieViewModel.g.dart';

class MovieViewModel =_MovieViewModel with _$MovieViewModel;

abstract class _MovieViewModel with Store{

  final categories = ["popular", "top_rated", "upcoming"];

  @observable
  ObservableList<MovieModel> movieModel = ObservableList<MovieModel>();

  @action
  void getMovieService() {
    categories.forEach((element) {
      serviceApi(element).then((value) =>
          movieModel.add(value)
      );
    });
  }

  Future<MovieModel> getService() async => await serviceApi("popular");

  void printValue() {
      movieModel.forEach((element) {
        element.results.forEach((result) {
          print("Response: ${element.results}");
        });
      });
  }
}