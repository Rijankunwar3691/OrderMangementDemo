import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/domain/provider/menu_repo_provider.dart';
import 'package:hoteldemo/features/menu/presentation/provider/state/menu_list_notifier.dart';
import 'package:hoteldemo/features/menu/presentation/provider/state/menu_state.dart';

final menuListProvider =
    StateNotifierProvider<MenuListNotifier, MenuState>((ref) {
  final menuRepository = ref.watch(menuRepoProvider);
  return MenuListNotifier(menuRepository: menuRepository);
});
