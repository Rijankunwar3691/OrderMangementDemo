import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/home/data/repository/tables_repo_imp.dart';
import 'package:hoteldemo/features/home/domain/repository/tables_repo.dart';

final tableRepoProvider = Provider<TablesRepository>((ref) {
  return TabelRepoImplementation();
});
