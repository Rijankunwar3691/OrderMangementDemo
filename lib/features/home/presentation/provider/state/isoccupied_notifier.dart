import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class IsOccupiedNotifier extends StateNotifier<bool> {
  IsOccupiedNotifier() : super(false);

  void isOccupied(List<ItemModel> orderList, String tableNo) {
    orderList.any((element) {
      if (element.id == tableNo) {
        return true;
      } else {
        return false;
      }
    });
  }
}
