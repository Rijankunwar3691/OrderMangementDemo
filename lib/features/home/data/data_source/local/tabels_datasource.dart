import 'package:hoteldemo/core/dummy/dummy_data.dart';
import 'package:hoteldemo/features/home/domain/model/tabel_model.dart';

class TableDataSource {
  List<TabelModel> getTabelData() {
    try {
      final tabelList = (tableData).map((e) => TabelModel.fromJson(e)).toList();
      return tabelList;
    } catch (e) {
      throw e.toString();
    }
  }
}
