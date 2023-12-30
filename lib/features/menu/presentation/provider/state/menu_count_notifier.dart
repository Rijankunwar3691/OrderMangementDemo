import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuCountNotifier extends StateNotifier<Map<String, int>> {
  MenuCountNotifier() : super({});

  void incrementCount(String itemName) {
    if (!state.containsKey(itemName)) {
      state[itemName] = 0;
    }
    state.update(itemName, (value) => value + 1);
    state = {...state};
  }

  void decrementCount(String itemName) {
    if (state.containsKey(itemName)) {
      if (state[itemName]! > 0) {
        state.update(itemName, (value) => value - 1);
        state = {...state};
      }
    }
  }
}
