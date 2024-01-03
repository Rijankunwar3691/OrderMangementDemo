import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/export.dart';

class TableContainer extends StatelessWidget {
  final String tableNo;
  final bool isOccupied;
  const TableContainer(
      {super.key, required this.tableNo, required this.isOccupied});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isOccupied ? Appcolors.accentOrange : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: SizedBox(
        height: 40.h,
        width: 40.w,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ReusableText.textWigdet(
                  text: tableNo, fw: FontWeight.bold, fSize: 22.sp),
              const Spacer(),
              isOccupied
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.people),
                        SizedBox(
                          width: 10.w,
                        ),
                        ReusableText.textWigdet(
                            text: '2',
                            color: Appcolors.greyInformation,
                            fSize: 16.sp),
                      ],
                    )
                  : Center(
                      child: ReusableText.textWigdet(
                          text: 'Empty', color: Appcolors.greyInformation),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
