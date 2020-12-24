import 'package:moviedb_flutter/application/storage/core/database/BaseDatabase.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MoviesResultsTable extends BaseDatabase{

  static final _databaseName = "MoviesDatabase.db";
  static final _databaseVersion = 1;

  final table = 'movies_table';
  final columnPopularity = 'popularity';
  final columnVoteCount = 'vote_count';
  final columnVideo = 'video';
  final columnPosterPath = 'poster_path';
  final columnId = 'id';
  final columnAdult = 'adult';
  final columnBackdropPath = 'backdrop_path';
  final columnOriginalLanguage = 'original_language';
  final columnOriginalTitle = 'original_title';
  final columnTitle = 'title';
  final columnVoteAverage = 'vote_average';
  final columnOverview = 'overview';
  final columnReleaseDate = 'release_date';

  MoviesResultsTable() : super(_databaseName, _databaseVersion);
  static final MoviesResultsTable instance = MoviesResultsTable();

  @override
  String entityTable() =>
      '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnPopularity TEXT NOT NULL,
            $columnVoteCount INTEGER NOT NULL,
            $columnVideo INTEGER NOT NULL,
            $columnPosterPath TEXT NOT NULL,
            $columnAdult INTEGER NOT NULL,
            $columnBackdropPath TEXT NOT NULL,
            $columnOriginalLanguage TEXT NOT NULL,
            $columnOriginalTitle TEXT NOT NULL,
            $columnTitle TEXT NOT NULL,
            $columnVoteAverage TEXT NOT NULL,
            $columnOverview TEXT NOT NULL,
            $columnReleaseDate TEXT NOT NULL
          )
      ''';

  @override
  Future<Database> getDatabase() => getInitDatabase();
}