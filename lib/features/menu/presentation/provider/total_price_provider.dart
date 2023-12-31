import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/presentation/provider/state/calculate_total_price_notifier.dart';
import 'package:hoteldemo/features/menu/presentation/provider/state/total_price_state.dart';

final totalPriceProvider =
    StateNotifierProvider<TotalPriceNotifier, TotalPriceState>((ref) {
  return TotalPriceNotifier();
});
