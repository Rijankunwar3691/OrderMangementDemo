import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/home/domain/model/tabel_model.dart';
import 'package:hoteldemo/features/home/domain/repository/tables_repo.dart';

class TableListNotifier extends StateNotifier<List<TabelModel>> {
  final TablesRepository tablesRepository;
  TableListNotifier({required this.tablesRepository}) : super([]) {
    getTableData();
  }

  void getTableData() {
    final data = tablesRepository.getTableData();
    state = data;
  }

  
}
