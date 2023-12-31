import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/orders/presentation/provider/state/order_state.dart';

class OrderStateNotifier extends StateNotifier<OrderState> {
  OrderStateNotifier() : super(OrderState(orderList: []));

  void getOrderList(Map<String, Map<String, int>> menuCount) {
    List<ItemModel> itemslist = [];
    menuCount.forEach((key, value) {
      final items = ItemModel(
          name: key, price: value['price'], id: 's', count: value['count']);
      itemslist.add(items);
    });
    state = state.copyWith(orderList: itemslist);
  }
}
