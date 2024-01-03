import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableText {
  static Text textWigdet(
      {required String text, double? fSize, FontWeight? fw, Color? color}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fSize ?? 12.sp,
          fontWeight: fw ?? FontWeight.normal,
          color: color ?? Colors.black),
    );
  }
}
