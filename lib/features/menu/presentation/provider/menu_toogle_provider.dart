import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/presentation/provider/state/menu_toogle_notifier.dart';

final menuCountProvider = StateNotifierProvider.autoDispose<MenuCountNotifier,
    Map<String, Map<String, int>>>((ref) {
  return MenuCountNotifier();
});
