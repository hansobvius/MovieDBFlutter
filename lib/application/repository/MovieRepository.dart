import 'package:moviedb_flutter/application/storage/tables/movies/content_provider/MoviesContentProvider.dart';

class MovieRepository{

  MovieContentProvider movieContentProvider = MovieContentProvider();

  void insertContent(Map<String, dynamic> row){
    movieContentProvider.insert(row);
  }

  void deleteContent(){
    movieContentProvider.delete();
  }

  Future<List<Map<String, dynamic>>> queryListContent() async {
    return await movieContentProvider.queryAllRows();
  }
}