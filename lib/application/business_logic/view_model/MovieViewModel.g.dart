// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieViewModel on _MovieViewModel, Store {
  final _$isSavedAtom = Atom(name: '_MovieViewModel.isSaved');

  @override
  Observable<bool> get isSaved {
    _$isSavedAtom.reportRead();
    return super.isSaved;
  }

  @override
  set isSaved(Observable<bool> value) {
    _$isSavedAtom.reportWrite(value, super.isSaved, () {
      super.isSaved = value;
    });
  }

  final _$movieModelAtom = Atom(name: '_MovieViewModel.movieModel');

  @override
  ObservableList<MovieModel> get movieModel {
    _$movieModelAtom.reportRead();
    return super.movieModel;
  }

  @override
  set movieModel(ObservableList<MovieModel> value) {
    _$movieModelAtom.reportWrite(value, super.movieModel, () {
      super.movieModel = value;
    });
  }

  final _$favoriteMoviesAtom = Atom(name: '_MovieViewModel.favoriteMovies');

  @override
  ObservableList<MovieModelResults> get favoriteMovies {
    _$favoriteMoviesAtom.reportRead();
    return super.favoriteMovies;
  }

  @override
  set favoriteMovies(ObservableList<MovieModelResults> value) {
    _$favoriteMoviesAtom.reportWrite(value, super.favoriteMovies, () {
      super.favoriteMovies = value;
    });
  }

  final _$_MovieViewModelActionController =
      ActionController(name: '_MovieViewModel');

  @override
  void getMovieService() {
    final _$actionInfo = _$_MovieViewModelActionController.startAction(
        name: '_MovieViewModel.getMovieService');
    try {
      return super.getMovieService();
    } finally {
      _$_MovieViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getFavoriteMovies() {
    final _$actionInfo = _$_MovieViewModelActionController.startAction(
        name: '_MovieViewModel.getFavoriteMovies');
    try {
      return super.getFavoriteMovies();
    } finally {
      _$_MovieViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkFavoriteMovie(int id) {
    final _$actionInfo = _$_MovieViewModelActionController.startAction(
        name: '_MovieViewModel.checkFavoriteMovie');
    try {
      return super.checkFavoriteMovie(id);
    } finally {
      _$_MovieViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMovieFavorite(MovieModelResults moviesResults) {
    final _$actionInfo = _$_MovieViewModelActionController.startAction(
        name: '_MovieViewModel.setMovieFavorite');
    try {
      return super.setMovieFavorite(moviesResults);
    } finally {
      _$_MovieViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSaved: ${isSaved},
movieModel: ${movieModel},
favoriteMovies: ${favoriteMovies}
    ''';
  }
}
