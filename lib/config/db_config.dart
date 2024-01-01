import 'package:hoteldemo/config/db_keys.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DataBaseConfig {
  Future<Database> initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'db_hotelDemo');

    final db = openDatabase(path, onCreate: _onCreate, version: 1);

    return db;
  }

  _onCreate(Database db, int version) async {
    return await db.execute(
        'CREATE TABLE ${DbKeys.tName}(${DbKeys.orderId} INTEGER PRIMARY KEY AUTOINCREMENT,${DbKeys.tid} TEXT ,${DbKeys.itemName} TEXT,${DbKeys.itemCount} INTEGER,${DbKeys.itemPrice} INTEGER,${DbKeys.billPrice} INTEGER)');
  }
}
