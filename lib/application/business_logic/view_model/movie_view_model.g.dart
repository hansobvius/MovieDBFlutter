// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieViewModel on _MovieViewModel, Store {
  late final _$isSavedAtom =
      Atom(name: '_MovieViewModel.isSaved', context: context);

  @override
  bool get isSaved {
    _$isSavedAtom.reportRead();
    return super.isSaved;
  }

  @override
  set isSaved(bool value) {
    _$isSavedAtom.reportWrite(value, super.isSaved, () {
      super.isSaved = value;
    });
  }

  late final _$movieModelAtom =
      Atom(name: '_MovieViewModel.movieModel', context: context);

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

  late final _$favoriteMoviesAtom =
      Atom(name: '_MovieViewModel.favoriteMovies', context: context);

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

  late final _$checkFavoriteMovieAsyncAction =
      AsyncAction('_MovieViewModel.checkFavoriteMovie', context: context);

  @override
  Future<dynamic> checkFavoriteMovie(int id) {
    return _$checkFavoriteMovieAsyncAction
        .run(() => super.checkFavoriteMovie(id));
  }

  late final _$_MovieViewModelActionController =
      ActionController(name: '_MovieViewModel', context: context);

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
