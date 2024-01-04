import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/orders/domain/repositories/orders_repo.dart';
import 'package:hoteldemo/features/orders/presentation/provider/state/order_state.dart';

class OrderStateNotifier extends StateNotifier<OrderState> {
  OrdersRepository ordersRepository;
  OrderStateNotifier({required this.ordersRepository})
      : super(OrderState(
          orderList: [],
          orderHistory: [],
          isLoad: false,
        ));

  void getOrderList(Map<String, Map<String, int>> menuCount, String id) {
    List<ItemModel> itemslist = [];
    menuCount.forEach((key, value) {
      final items = ItemModel(
          name: key, price: value['price'], id: id, count: value['count']);
      itemslist.add(items);
    });
    state = state.copyWith(orderList: itemslist);
  }

  Future<void> saveOrder(
      {required List<ItemModel> items, required int billPrice}) async {
    await ordersRepository.saveOrder(items: items, billPrice: billPrice);
  }

  Future<void> getOrderHistory() async {
    state = state.copyWith(isLoad: true);
    final data = await ordersRepository.getOrdersList();

    state = state.copyWith(isLoad: false, orderHistory: data);
  }

  Future<void> deleteOrder(int id) async {
    await ordersRepository.deleteOrder(id);
  }

  Future<void> incrementOrder(int count, int id, ItemModel data) async {
    count = (count + 1);

    data.count = count;

    await ordersRepository.updateOrder(id, data);
  }

  Future<void> decrementOrder(int count, int id, ItemModel data) async {
    if (count > 0) {
      count = count - 1;
      data.count = count;

      await ordersRepository.updateOrder(id, data);
    }
  }
}
