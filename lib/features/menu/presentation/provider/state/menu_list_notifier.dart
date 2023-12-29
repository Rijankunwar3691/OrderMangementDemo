import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/menu/domain/repository/menu_repo.dart';
import 'package:hoteldemo/features/menu/presentation/provider/state/menu_state.dart';

class MenuListNotifier extends StateNotifier<MenuState> {
  final MenuRepository menuRepository;
  MenuListNotifier({required this.menuRepository})
      : super(MenuState(veg: [], nonVeg: [], drinks: [], menuList: []));

  void getMenuList() {
    final menuList = menuRepository.getMenuList();

    state = state.copyWith(
        menuList: allMenu(menuList),
        veg: filterVeg(menuList),
        nonVeg: filterNonVeg(menuList),
        drinks: filterDrinks(menuList));
  }

  List<String> allMenu(List<MenuModel> menuList) {
    List<String> filtered = [];
    for (var item in menuList) {
      filtered.addAll(item.items!.toList());
    }
    return filtered;
  }

  List<String> filterVeg(List<MenuModel> menuList) {
    List<String> filtered = [];
    for (var item in menuList) {
      if (item.category == 'Veg') {
        filtered.addAll(item.items!.toList());
      }
    }

    return filtered;
  }

  List<String> filterNonVeg(List<MenuModel> menuList) {
    List<String> filtered = [];
    for (var item in menuList) {
      if (item.category == 'Non-Veg') {
        filtered.addAll(item.items!.toList());
      }
    }
    return filtered;
  }

  List<String> filterDrinks(List<MenuModel> menuList) {
    List<String> filtered = [];
    for (var item in menuList) {
      if (item.category == 'Drinks') {
        filtered.addAll(item.items!.toList());
      }
    }
    return filtered;
  }
}
