class MenuState {
  final List<String> veg;
  final List<String> nonVeg;
  final List<String> drinks;
  final List<String> menuList;

  MenuState({
    required this.veg,
    required this.nonVeg,
    required this.drinks,
    required this.menuList,
  });

  MenuState copyWith(
      {List<String>? veg,
      List<String>? nonVeg,
      List<String>? drinks,
      List<String>? menuList}) {
    return MenuState(
        veg: veg ?? this.veg,
        nonVeg: nonVeg ?? this.nonVeg,
        drinks: drinks ?? this.drinks,
        menuList: menuList ?? this.menuList);
  }
}
