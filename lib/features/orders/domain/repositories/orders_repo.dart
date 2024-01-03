import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

abstract class OrdersRepository {
  Future<void> saveOrder(
      {required List<ItemModel> items, required int billPrice});
  Future<List<ItemModel>> getOrdersList();
  Future<void> deleteOrder(int id);
  Future<void> updateOrder(int id, ItemModel data);
}
