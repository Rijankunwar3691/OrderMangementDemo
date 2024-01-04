import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class OrderState {
  final bool isLoad;
  final List<ItemModel> orderList;
  final List<ItemModel> orderHistory;


  OrderState({required this.orderList, required this.isLoad,required this.orderHistory});

  OrderState copyWith({List<ItemModel>? orderList, bool? isLoad,List<ItemModel>? orderHistory}) {
    return OrderState(
        orderList: orderList ?? this.orderList, isLoad: isLoad ?? this.isLoad,orderHistory:orderHistory ?? this.orderHistory );
  }
}
