import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/presentation/provider/state/menu_count_notifier.dart';

final menuCountProvider =
    StateNotifierProvider<MenuCountNotifier, Map<String, int>>((ref) {
  return MenuCountNotifier();
});
