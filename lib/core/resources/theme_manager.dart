import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/resources/colors_manager.dart';

class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black),
        color: Colors.white60,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w600),
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        labelStyle: TextStyle(fontSize: 18.sp),
        unselectedLabelStyle: TextStyle(fontSize: 14.sp),
        unselectedLabelColor: Appcolors.blackPrimaryMinus2,
        labelPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        indicator: BoxDecoration(
            color: Appcolors.primary,
            borderRadius: BorderRadius.circular(25.r)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
            backgroundColor: Appcolors.primary,
            elevation: 0.0,
            minimumSize: Size(50.w, 50.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r))),
      ),
    );
  }
}
