import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModelResults.dart';
import 'package:moviedb_flutter/application/di/ServiceLocator.dart';
import 'package:moviedb_flutter/application/service/ServiceApi.dart';

part 'MovieViewModel.g.dart';

class MovieViewModel =_MovieViewModel with _$MovieViewModel;

abstract class _MovieViewModel with Store{

  final service = ServiceLocator.provideIService();
  final movieRepository = ServiceLocator.provideMovieRepository();

  final categories = ["popular", "top_rated", "upcoming"];

  @observable
  ObservableList<MovieModel> movieModel = ObservableList<MovieModel>();

  @observable
  ObservableList<MovieModelResults> favoriteMovies = ObservableList<MovieModelResults>();

  @action
  void getMovieService() {
    categories.forEach((element) {
      service.serviceInterface().serviceApi(element).then((value) =>
          movieModel.add(value)
      );
    });
  }

  @action
  void getFavoriteMovies(){
    movieRepository.queryListContent().then((values) =>
      values.forEach((element) {
        favoriteMovies.add(MovieModelResults.fromJson(element));
      })
    );
  }

  @action
  void setMovieFavorite(MovieModelResults moviesResults){
    movieRepository.insertContent(moviesResults.toJson());
  }

  void printValue() {
      movieModel.forEach((element) {
        element.results.forEach((result) {
          print("Response: ${element.results}");
        });
      });
  }
}