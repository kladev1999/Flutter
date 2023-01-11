import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  String tableName = 'project_BuyDB';


//Create database and search path for creating database
  setDatabase() async {
    var directory = await getDatabasesPath();
    var path = join(directory, 'db_project_Buy'); //path creat directory name db_project_Buy
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {  //creat database have path
    await database.execute('''CREATE TABLE $tableName(
      id INTEGER PRIMARY KEY,
      name TEXT,
      details TEXT,
      price TEXT,
      category TEXT,
      image TEXT
      )''');
  }
}
