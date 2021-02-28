import 'package:flutter/foundation.dart';
import 'package:moviedb_flutter/application/storage/tables/movies/content_provider/MoviesContentProvider.dart';

class MovieRepository{

  final MovieContentProvider movieContentProvider;

  MovieRepository({@required this.movieContentProvider});

  Future insertContent(Map<String, dynamic> row) async {
    await movieContentProvider.insert(row);
  }

  void deleteContent(){
    movieContentProvider.delete();
  }

  Future<List<Map<String, dynamic>>> queryListContent() async {
    return await movieContentProvider.queryAllRows();
  }

  Future<int> movieSaved(int id)  {
    return  movieContentProvider.checkSavedMovie(id);
  }

  Future deleteMovie(int id) async => await movieContentProvider.deleteRow(id);
}