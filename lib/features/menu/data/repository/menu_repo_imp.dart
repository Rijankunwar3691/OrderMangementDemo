import 'package:hoteldemo/features/menu/data/data%20source/remote/menu_datasource.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/menu/domain/repository/menu_repo.dart';

class MenuRepositoryImplementation implements MenuRepository {
  final MenuDataSource menuDataSource;

  MenuRepositoryImplementation({required this.menuDataSource});
  @override
  List<MenuModel> getMenuList() {
    final response = menuDataSource.getMenuList();
    return response;
  }
}
