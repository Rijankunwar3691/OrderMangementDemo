import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class TableDetailNotifier extends StateNotifier<List<ItemModel>> {
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
}
