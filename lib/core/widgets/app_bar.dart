import 'package:flutter/material.dart';

class AppBarWidget {
  static AppBar appBar({required String title}) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 0.0,
    );
  }
}
