import 'package:hoteldemo/features/home/domain/model/tabel_model.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class SearchState {
  final List<TabelModel> tableSearchResult;
  final List<ItemModel> itemSearchResult;

  SearchState(
      {required this.tableSearchResult, required this.itemSearchResult});

  SearchState copyWith(
      {List<TabelModel>? tableSearchResult,
      List<ItemModel>? itemSearchResult}) {
    return SearchState(
        tableSearchResult: tableSearchResult ?? this.tableSearchResult,
        itemSearchResult: itemSearchResult ?? this.itemSearchResult);
  }
}
