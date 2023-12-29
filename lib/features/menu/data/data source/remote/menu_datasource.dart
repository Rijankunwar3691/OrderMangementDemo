import 'package:hoteldemo/core/dummy/dummy_data.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class MenuDataSource {
  List<MenuModel> getMenuList() {
    try {
      final menuList = menu.map((e) => MenuModel.fromJson(e)).toList();
      return menuList;
    } catch (e) {
      throw e.toString();
    }
  }
}
