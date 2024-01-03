import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/home/presentation/provider/state/isoccupied_notifier.dart';

final isOccupiedProvider =
    StateNotifierProvider<IsOccupiedNotifier, bool>((ref) {
  return  IsOccupiedNotifier();
});
