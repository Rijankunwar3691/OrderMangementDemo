import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/orders/data/repositories/order_repo_imp.dart';
import 'package:hoteldemo/features/orders/domain/repositories/orders_repo.dart';

final orderRepoProvider = Provider<OrdersRepository>((ref) {
  return OrderRepoImp();
});