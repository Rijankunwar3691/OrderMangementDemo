import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';

class CustomSnackBar {
  static SnackBar snackBar({required String msg}) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      content:
          ReusableText.textWigdet(text: msg, color: Colors.white, fSize: 14.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      backgroundColor: Colors.blueAccent,
      behavior: SnackBarBehavior.floating,
    );
  }
}
