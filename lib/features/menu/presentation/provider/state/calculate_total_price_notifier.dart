import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/presentation/provider/state/total_price_state.dart';

class TotalPriceNotifier extends StateNotifier<TotalPriceState> {
  TotalPriceNotifier() : super(TotalPriceState(totalPrice: 0, totalBill: 0.0));

  void calculateTotalPrice(Map<String, Map<String, int>> orders) {
    List price = [];
    orders.forEach((key, value) {
      price.add(value["price"]);
    });

    if (price.isNotEmpty) {
      int totalPrice = price.reduce((a, b) => a + b);
      double totalBill = totalPrice + 20;
      state = state.copyWith(totalPrice, totalBill);
    }
  }
}
