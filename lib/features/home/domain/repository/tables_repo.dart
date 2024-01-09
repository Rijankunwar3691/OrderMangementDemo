import 'package:hoteldemo/features/home/domain/model/tabel_model.dart';

abstract class TablesRepository {
  List<TabelModel> getTableData();
  
}
