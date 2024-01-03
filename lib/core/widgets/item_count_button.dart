import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';

class ItemButtonCount extends StatelessWidget {
  final String? count;
  final void Function()? onPressedMin;
  final void Function()? onPressedAdd;
  const ItemButtonCount(
      {super.key,
      required this.count,
      required this.onPressedMin,
      required this.onPressedAdd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
              alignment: Alignment(0, -0.5.h),
              onPressed: onPressedMin,
              icon: Icon(
                Icons.minimize,
                size: 18.h,
              )),
        ),
        ReusableText.textWigdet(text: count ?? 0.toString()),
        Expanded(
          child: IconButton(
              onPressed: onPressedAdd,
              icon: Icon(
                Icons.add,
                size: 18.h,
              )),
        ),
      ],
    );
  }
}
