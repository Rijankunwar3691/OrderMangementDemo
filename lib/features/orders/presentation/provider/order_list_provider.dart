import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/orders/domain/providers/order_repo_provider.dart';
import 'package:hoteldemo/features/orders/presentation/provider/state/order_state.dart';
import 'package:hoteldemo/features/orders/presentation/provider/state/order_state_notifier.dart';

final orderListProvider =
    StateNotifierProvider<OrderStateNotifier, OrderState>((ref) {
  final ordersRepository = ref.watch(orderRepoProvider);
  return OrderStateNotifier(ordersRepository: ordersRepository);
});
