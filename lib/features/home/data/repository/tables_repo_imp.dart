import 'package:hoteldemo/features/home/data/data_source/local/tabels_datasource.dart';
import 'package:hoteldemo/features/home/domain/model/tabel_model.dart';
import 'package:hoteldemo/features/home/domain/repository/tables_repo.dart';

class TabelRepoImplementation implements TablesRepository {
  TableDataSource tableDataSource = TableDataSource();
  @override
  List<TabelModel> getTableData() {
    final data = tableDataSource.getTabelData();
    return data;
  }
}
