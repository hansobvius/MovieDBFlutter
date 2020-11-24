// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieViewModel on _MovieViewModel, Store {
  final _$movieModelAtom = Atom(name: '_MovieViewModel.movieModel');

  @override
  List<MovieModel> get movieModel {
    _$movieModelAtom.reportRead();
    return super.movieModel;
  }

  @override
  set movieModel(List<MovieModel> value) {
    _$movieModelAtom.reportWrite(value, super.movieModel, () {
      super.movieModel = value;
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
  String toString() {
    return '''
movieModel: ${movieModel}
    ''';
  }
}
