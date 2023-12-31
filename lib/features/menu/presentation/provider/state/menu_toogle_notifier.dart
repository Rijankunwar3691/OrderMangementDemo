import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuCountNotifier extends StateNotifier<Map<String, Map<String, int>>> {
  MenuCountNotifier() : super({});

  void incrementCount(String itemName, int price) {
    if (!state.containsKey(itemName)) {
      state[itemName] = {
        'count': 0,
        'price': 0,
      };
    }

    state[itemName]!.update('count', (value) => value + 1);
    state[itemName]!.update('price', (value) => value + price);

    state = {...state};
  }

  void decrementCount(String itemName, int price) {
    if (state.containsKey(itemName)) {
      if (state[itemName]!['count']! > 0) {
        state[itemName]!.update('count', (value) => value - 1);
        state[itemName]!.update('price', (value) => value - price);
        state = {...state};
      }
      if (state[itemName]!['count'] == 0) {
        state.remove(itemName);
        state = {...state};
      }
    }
  }
}
