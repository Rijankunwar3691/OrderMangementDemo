import 'package:hoteldemo/config/db_services.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class OrderDataSource {
  final DbServices _dbServices = DbServices();
  Future<List<ItemModel>> getOrders() async {
    try {
      final data = await _dbServices.getOrders();

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> saveOrders(
      {required List<ItemModel> items, required int billPrice}) async {
    try {
      await _dbServices.insert(items, billPrice);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteOrder(int id) async {
    await _dbServices.deleteOrder(id);
  }

  Future<void> updateOrder(int id, ItemModel data) async {
    await _dbServices.updateOrder(id, data);
  }
}
