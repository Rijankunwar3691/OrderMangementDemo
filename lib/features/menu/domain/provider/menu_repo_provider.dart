import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/data/data%20source/remote/menu_datasource.dart';
import 'package:hoteldemo/features/menu/data/repository/menu_repo_imp.dart';
import 'package:hoteldemo/features/menu/domain/repository/menu_repo.dart';

final menuRepoProvider = Provider<MenuRepository>((ref) {
  MenuDataSource menuDataSource = MenuDataSource();
  return MenuRepositoryImplementation(menuDataSource: menuDataSource);
});
