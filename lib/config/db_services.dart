import 'package:hoteldemo/config/db_config.dart';
import 'package:hoteldemo/config/db_keys.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class DbServices {
  Future<void> insert(List<ItemModel> items, int billPrice) async {
    final db = await DataBaseConfig().initDatabase();
    for (ItemModel e in items) {
      final data = ItemModel(
          id: e.id,
          name: e.name,
          count: e.count,
          price: e.price,
          billPrice: billPrice);

      await db.insert(DbKeys.tName, data.tojson());
    }
  }

  Future<List<ItemModel>> getOrders() async {
    final db = await DataBaseConfig().initDatabase();
    List<Map<String, dynamic>> data = await db.query(DbKeys.tName);

    return List.generate(data.length, (index) {
      return ItemModel.fromJson(data[index]);
    });
  }

  deleteOrder(int id) async {
    final db = await DataBaseConfig().initDatabase();

    await db
        .delete(DbKeys.tName, where: '${DbKeys.orderId} = ?', whereArgs: [id]);
  }

  updateOrder(int id, ItemModel items) async {
    final db = await DataBaseConfig().initDatabase();
    db.update(
      DbKeys.tName,
      items.tojson(),
      where: '${DbKeys.orderId} = ?',
      whereArgs: [id],
    );
  }

  clearTable(String id) async {
    final db = await DataBaseConfig().initDatabase();

    await db.delete(DbKeys.tName, where: '${DbKeys.tid} = ?', whereArgs: [id]);
  }
}
