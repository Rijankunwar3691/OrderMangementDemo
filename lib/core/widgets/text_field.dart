import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextFormField extends StatelessWidget {
  final String hintText;
  final double radius;
  const BuildTextFormField(
      {super.key, required this.hintText, required this.radius});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black54,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
          hintText: hintText,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius))),
    );
  }
}
