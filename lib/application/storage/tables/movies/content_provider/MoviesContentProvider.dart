import 'package:moviedb_flutter/application/storage/core/provider/BaseProvider.dart';
import 'package:moviedb_flutter/application/storage/core/provider/IProvider.dart';
import 'package:moviedb_flutter/application/storage/tables/movies/table_helper/MoviesResultsTable.dart';
import 'package:sqflite/sqflite.dart';

class MovieContentProvider extends BaseProvider<MoviesResultsTable> implements IProvider{

  MovieContentProvider() : super(entityDatabase: MoviesResultsTable.instance);

  @override
  Future<int> delete() async {
    return await db!.delete(entityDatabase.table);
  }

  @override
  Future<int> insert(Map<String, dynamic> row) async {
    return await db!.insert(entityDatabase.table, row);
  }

  @override
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    if(db == null) await initDataBase();
    return await db!.query(entityDatabase.table);
  }

  @override
  Future<int> queryRowCount() async => throw UnimplementedError();

  @override
  Future<int> update(Map<String, dynamic> row, String columnId) async {
    return await db!.update(entityDatabase.table, row, where: '$columnId = ?', whereArgs: [row[columnId]]);
  }

  Future<int?> checkSavedMovie(int id) async {
    if(db == null) await initDataBase();
    var movieAlreadySaved = Sqflite.firstIntValue(
        await db!.rawQuery("SELECT EXISTS(SELECT 1 FROM ${entityDatabase.table} WHERE id=$id)")
    );
    return movieAlreadySaved;
  }

  Future deleteRow(int? id) async {
    await db!.rawDelete("DELETE FROM ${entityDatabase.table} WHERE id=$id");
  }
}