import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/features/authentication/presentation/provider/state/validator.dart';

final validatorProvider = StateNotifierProvider<ValidatorNotifier,String>((ref) {
  return ValidatorNotifier();
});