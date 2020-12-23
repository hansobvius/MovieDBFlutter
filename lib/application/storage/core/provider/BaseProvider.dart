import 'package:moviedb_flutter/application/storage/core/database/BaseDatabase.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class BaseProvider<T extends BaseDatabase>{

  final T entityDatabase;

  Database _db;
  Database get db => _db;

  BaseProvider({this.entityDatabase}){
    initDataBase();
  }

  initDataBase() async{
    _db = await entityDatabase.getDatabase();
  }
}