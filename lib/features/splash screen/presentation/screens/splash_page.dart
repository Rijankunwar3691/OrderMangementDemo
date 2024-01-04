import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, AppRoutes.loginRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150.h,
          ),
          Center(
            child: Image.asset(
              ImageAssets.waiterImage,
              height: 350.h,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          TweenAnimationBuilder(
            duration: const Duration(seconds: 2),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            builder: (BuildContext context, dynamic value, Widget? child) {
              return Opacity(
                opacity: value,
                child: ReusableText.textWigdet(
                    text: 'Manage Tables Easily',
                    fSize: 28.sp,
                    fw: FontWeight.bold,
                    color: Appcolors.accentOrange),
              );
            },
          ),
          SizedBox(
            height: 7.h,
          ),
          TweenAnimationBuilder(
            duration: const Duration(seconds: 2),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            builder: (BuildContext context, dynamic value, Widget? child) {
              return Opacity(
                opacity: value,
                child: ReusableText.textWigdet(
                  text: 'Reliable and Faster Table',
                  fSize: 22.sp,
                  fw: FontWeight.w500,
                ),
              );
            },
          ),
          SizedBox(
            height: 4.h,
          ),
          TweenAnimationBuilder(
            duration: const Duration(seconds: 2),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            builder: (BuildContext context, dynamic value, Widget? child) {
              return Opacity(
                opacity: value,
                child: ReusableText.textWigdet(
                  text: 'Orders for Waiters',
                  fSize: 21.sp,
                  fw: FontWeight.w400,
                ),
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 220.h),
            child: ReusableText.textWigdet(
              text: 'Powered by Rijan Kunwar',
              fSize: 12.sp,
              fw: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
