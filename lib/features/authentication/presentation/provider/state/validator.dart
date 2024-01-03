import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidatorNotifier extends StateNotifier<String> {
  ValidatorNotifier() : super('');

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'email is required ';
    } else if (!value.contains('@')) {
      return 'enter valid email ';
    } else if (value != 'admin@gmail.com') {
      return 'incorrect email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'password is required ';
    } else if (value != '12345678') {
      return 'incorrect password';
    }
    return null;
  }
}
