abstract class IProvider{
  Future<int> insert(Map<String, dynamic> row);

  Future<List<Map<String, dynamic>>> queryAllRows();

  Future<int> queryRowCount();

  Future<int> update(Map<String, dynamic> row, String columnId);

  Future<int> delete();
}