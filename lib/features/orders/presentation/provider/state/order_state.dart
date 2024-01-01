import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class OrderState {
  final bool isLoad;
  final List<ItemModel> orderList;

  OrderState({required this.orderList, required this.isLoad});

  OrderState copyWith({List<ItemModel>? orderList, bool? isLoad}) {
    return OrderState(
        orderList: orderList ?? this.orderList, isLoad: isLoad ?? this.isLoad);
  }
}
