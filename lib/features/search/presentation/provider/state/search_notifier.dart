import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/home/domain/model/tabel_model.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/search/presentation/provider/state/search_state.dart';

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier()
      : super(SearchState(tableSearchResult: [], itemSearchResult: []));

  void filterTableSearch(String query, List<TabelModel> tableList) {
    List<TabelModel> filteredList = [];

    filteredList = tableList
        .where((element) =>
            element.id!.toUpperCase().contains(query.toUpperCase()))
        .toList();

    state = state.copyWith(tableSearchResult: [...filteredList]);
  }

  void filterItemSearch(String query, List<ItemModel> itemList) {
    List<ItemModel> filteredList = [];
    filteredList = itemList
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    state = state.copyWith(itemSearchResult: [...filteredList]);
  }
}
