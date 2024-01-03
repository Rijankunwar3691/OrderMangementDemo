import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/search/presentation/provider/state/search_notifier.dart';
import 'package:hoteldemo/features/search/presentation/provider/state/search_state.dart';

final searchResultProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});
