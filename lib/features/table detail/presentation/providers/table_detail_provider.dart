import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/table%20detail/data/local/table_datasource.dart';

final tableDetailProvider =
    StateNotifierProvider<TableDetailNotifier, List<ItemModel>>((ref) {
  return TableDetailNotifier();
});
