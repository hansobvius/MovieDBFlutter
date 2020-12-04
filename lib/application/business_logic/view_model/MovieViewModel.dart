import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/di/ServiceLocator.dart';
import 'package:moviedb_flutter/application/service/ServiceApi.dart';

part 'MovieViewModel.g.dart';

class MovieViewModel =_MovieViewModel with _$MovieViewModel;

abstract class _MovieViewModel with Store{

  final service = ServiceLocator.provideIService();

  final categories = ["popular", "top_rated", "upcoming"];

  @observable
  ObservableList<MovieModel> movieModel = ObservableList<MovieModel>();

  @action
  void getMovieService() {
    categories.forEach((element) {
      service.serviceInterface().serviceApi(element).then((value) =>
          movieModel.add(value)
      );
    });
  }

  void printValue() {
      movieModel.forEach((element) {
        element.results.forEach((result) {
          print("Response: ${element.results}");
        });
      });
  }
}