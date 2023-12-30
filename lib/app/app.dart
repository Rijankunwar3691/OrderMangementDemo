import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/features/bottom%20navbar/bottom_navbar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MaterialApp(
          onGenerateRoute: RoutesGenerator.getRoute,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme(),
          home: const CustomButtomBar(),
        );
      },
    );
  }
}