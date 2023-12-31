import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class OrderState {
  final List<ItemModel> orderList;

  OrderState({required this.orderList});

  OrderState copyWith({List<ItemModel>? orderList}) {
    return OrderState(orderList: orderList ?? this.orderList);
  }
}
