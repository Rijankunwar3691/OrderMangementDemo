import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

abstract class MenuRepository {
  List<MenuModel> getMenuList();
}
