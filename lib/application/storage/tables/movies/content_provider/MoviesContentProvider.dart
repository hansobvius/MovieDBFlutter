import 'package:moviedb_flutter/application/storage/core/provider/BaseProvider.dart';
import 'package:moviedb_flutter/application/storage/core/provider/IProvider.dart';

class MovieContentProvider extends BaseProvider implements IProvider{

  @override
  Future<int> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<int> insert(Map<String, dynamic> row) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> queryAllRows() {
    // TODO: implement queryAllRows
    throw UnimplementedError();
  }

  @override
  Future<int> queryRowCount() {
    // TODO: implement queryRowCount
    throw UnimplementedError();
  }

  @override
  Future<int> update(Map<String, dynamic> row, String columnId) {
    // TODO: implement update
    throw UnimplementedError();
  }

}