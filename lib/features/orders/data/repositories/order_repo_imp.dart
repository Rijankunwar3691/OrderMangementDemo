import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/orders/data/local/order_datasource.dart';
import 'package:hoteldemo/features/orders/domain/repositories/orders_repo.dart';

class OrderRepoImp implements OrdersRepository {
  final OrderDataSource orderDataSource = OrderDataSource();
  @override
  Future<List<ItemModel>> getOrdersList() async {
    final orders = await orderDataSource.getOrders();
    return orders;
  }

  @override
  Future<void> saveOrder(
      {required List<ItemModel> items, required int billPrice}) async {
    await orderDataSource.saveOrders(items: items, billPrice: billPrice);
  }

  @override
  Future<void> deleteOrder(int id) async {
    await orderDataSource.deleteOrder(id);
  }

  @override
  Future<void> updateOrder(int id, ItemModel data) async {
    await orderDataSource.updateOrder(id, data);
  }
}
