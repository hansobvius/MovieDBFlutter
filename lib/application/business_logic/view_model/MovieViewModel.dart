import 'package:mobx/mobx.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModelResults.dart';
import 'package:moviedb_flutter/application/di/ServiceLocator.dart';

part 'MovieViewModel.g.dart';

class MovieViewModel =_MovieViewModel with _$MovieViewModel;

abstract class _MovieViewModel with Store {

  final service = ServiceLocator.instance.service;
  final movieRepository = ServiceLocator.instance.movieRepositoty;

  final categories = ["popular", "top_rated", "upcoming"];

  @observable
  Observable<bool> isSaved = Observable(false);

  @observable
  ObservableList<MovieModel> movieModel = ObservableList<MovieModel>()
      .asObservable();

  @observable
  ObservableList<MovieModelResults> favoriteMovies = ObservableList<
      MovieModelResults>().asObservable();


  // TODO - consult repository instead service api directly
  @action
  void getMovieService()  {
     categories.forEach((element) {
      service.serviceInterface().serviceApi(element).then((value) =>
          movieModel.add(value)
      );
    });
  }

  @action
  void getFavoriteMovies()   {
     movieRepository.queryListContent().then((values) => {
      values.forEach((element) {
        var favorite = getResultsFromDatabase(element);
        print("$element");
        favoriteMovies.add(favorite);
      }),
    });
  }

  @action
  void checkFavoriteMovie(int id)  {
      print("CHECK_FAVORITE");
      movieRepository.movieSaved(id).then((value) => {
        print("MOVIE ${value == 1}"),
        this.isSaved.value = value == 1
      });
  }

  @action
  void setMovieFavorite(MovieModelResults moviesResults)  {
    if(!isSaved.value)
       movieRepository.insertContent(moviesResults.toJson()).then((_) => {
        print("MOVIE SAVED"),
        getFavoriteMovies()
      });
    else  movieRepository.deleteMovie(moviesResults.id).then((value) => print("MOVIE DELETED"));
   checkFavoriteMovie(moviesResults.id);
  }

  void printValue() {
      movieModel.forEach((element) {
        element.results.forEach((result) {
          print("Response: ${element.results}");
        });
      });
  }

  MovieModelResults getResultsFromDatabase(Map<String, dynamic> json) =>
      MovieModelResults(
        popularity: returnStringToDouble(json['popularity'] as String),
        vote_count: json['vote_count'] as int,
        video: returnIntToBool(json['video'] as int),
        poster_path: json['poster_path'] as String,
        id: json['id'] as int,
        adult: returnIntToBool(json['adult'] as int),
        backdrop_path: json['backdrop_path'] as String,
        original_language: json['original_language'] as String,
        original_title: json['original_title'] as String,
        title: json['title'] as String,
        vote_average: returnStringToDouble(json['vote_average'] as String),
        overview: json['overview'] as String,
        release_date: json['release_date'] as String,
      );

  double returnStringToDouble(String value) => double.parse(value);

  bool returnIntToBool(int value){
    switch(value){
      case 0: return false;
      case 1: return true;
      default: return false;
    }
  }
}