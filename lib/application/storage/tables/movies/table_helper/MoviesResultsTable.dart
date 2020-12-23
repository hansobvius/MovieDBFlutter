import 'package:moviedb_flutter/application/storage/core/database/BaseDatabase.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MoviesResultsTable extends BaseDatabase{

  static final _databaseName = "MoviesDatabase.db";
  static final _databaseVersion = 1;

  final moviesTable = 'movies_table';
  final columnPopularity = 'popularity';
  final columnVoteCount = 'votecount';
  final columnVideo = 'video';
  final columnPosterPath = 'posterpath';
  final columnId = '_id';
  final columnAdult = 'adult';
  final columnBackdropPath = 'backdroppath';
  final columnOriginalLanguage = 'originallanguage';
  final columnOriginalTitle = 'originaltitle';
  final columnTitle = 'title';
  final columnVoteAverage = 'voteaverage';
  final columnOverview = 'overview';
  final columnReleaseDate = 'releasedate';

  MoviesResultsTable() : super(_databaseName, _databaseVersion);
  static final MoviesResultsTable instance = MoviesResultsTable();

  @override
  String entityTable() =>
      '''
          CREATE TABLE $moviesTable (
            $columnId INTEGER PRIMARY KEY,
            $columnPopularity DOUBLE NOT NULL,
            $columnVoteCount INTEGER NOT NULL,
            $columnVideo BOOLEAN NOT NULL,
            $columnPosterPath TEXT NOT NULL,
            $columnAdult BOOLEAN NOT NULL,
            $columnBackdropPath TEXT NOT NULL,
            $columnOriginalLanguage TEXT NOT NULL,
            $columnOriginalTitle TEXT NOT NULL,
            $columnTitle TEXT NOT NULL,
            $columnVoteAverage DOUBLE NOT NULL,
            $columnOverview TEXT NOT NULL,
            $columnReleaseDate TEXT NOT NULL
          )
      ''';

  @override
  Future<Database> getDatabase() => getInitDatabase();
}