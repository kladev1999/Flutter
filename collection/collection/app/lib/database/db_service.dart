import 'package:sqflite/sqflite.dart';
import 'db_connection.dart';

class DBService {
  late DatabaseConnection  _databaseConnection;
  String tableName = 'project_BuyDB';

  DBService() {
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  get profileId => null;

  readData() async {
    var connection = await database;
    return await connection?.query(tableName);
  }

  insertData(data) async {
    var connection = await database;
    return await connection?.insert(tableName, data);
  }

  deleteData(productId) async {
    var connection = await database;
    return await connection
        ?.delete(tableName, where: 'id=?', whereArgs: [productId]);
  }
}
