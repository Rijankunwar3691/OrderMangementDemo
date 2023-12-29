import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/home/domain/model/tabel_model.dart';
import 'package:hoteldemo/features/home/domain/provider/table_repo_provider.dart';
import 'package:hoteldemo/features/home/presentation/provider/state/table_notifier.dart';

final tableListProvider =
    StateNotifierProvider<TableListNotifier, List<TabelModel>>((ref) {
  final tablesRepository = ref.watch(tableRepoProvider);
  return TableListNotifier(tablesRepository: tablesRepository);
});
