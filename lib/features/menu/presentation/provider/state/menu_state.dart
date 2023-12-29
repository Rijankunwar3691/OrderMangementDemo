import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class MenuState {
  final List<ItemModel> veg;
  final List<ItemModel> nonVeg;
  final List<ItemModel> drinks;
  final List<ItemModel> menuList;

  MenuState({
    required this.veg,
    required this.nonVeg,
    required this.drinks,
    required this.menuList,
  });

  MenuState copyWith(
      {List<ItemModel>? veg,
      List<ItemModel>? nonVeg,
      List<ItemModel>? drinks,
      List<ItemModel>? menuList}) {
    return MenuState(
        veg: veg ?? this.veg,
        nonVeg: nonVeg ?? this.nonVeg,
        drinks: drinks ?? this.drinks,
        menuList: menuList ?? this.menuList);
  }
}
