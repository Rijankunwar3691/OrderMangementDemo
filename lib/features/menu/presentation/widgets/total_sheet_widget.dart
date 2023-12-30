import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
 

class TotalSheetWidget extends StatelessWidget {
  const TotalSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50.h,
            width: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Appcolors.accentOrange),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReusableText.textWigdet(
                    text: '3 Item', fSize: 16.sp, fw: FontWeight.w500),
                Container(
                  height: 35.h,
                  width: 2.w,
                  color: Appcolors.accentOrange,
                ),
                ReusableText.textWigdet(
                  color: Appcolors.primary,
                  text: 'Rs 500',
                  fSize: 16.sp,
                  fw: FontWeight.w500,
                )
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.orderSummaryPage);
              },
              child: const Text('View Order'))
        ],
      ),
    );
  }
}
