import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/config/db_services.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class TableDetailNotifier extends StateNotifier<List<ItemModel>> {
  DbServices dbServices = DbServices();
  TableDetailNotifier() : super([]);

  void filterTableData(List<ItemModel> itemList, String tableNo) {
    List<ItemModel> filteredList = [];

    for (var item in itemList) {
      if (tableNo == item.id) {
        filteredList.add(item);
      }
    }
    state = [...filteredList];
  }

  Future<void> clearTable(String? id) async {
    try {
      await dbServices.clearTable(id.toString());
      state = [];
    } catch (e) {
      throw e;
    }
  }
}
