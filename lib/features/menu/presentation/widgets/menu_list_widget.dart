import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/resources/colors_manager.dart';
import 'package:hoteldemo/core/widgets/reusable_text.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';

class MenuListWidget extends StatelessWidget {
  final ItemModel items;
  const MenuListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            color: Appcolors.accentOrange,
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ReusableText.textWigdet(
                    text: items.name.toString(),
                    fSize: 18.sp,
                    fw: FontWeight.w600),
                SizedBox(
                  height: 8.h,
                ),
                ReusableText.textWigdet(
                    color: Appcolors.greyInformation,
                    text: 'Lorem Ipsum is simply dummy text.',
                    fSize: 14.sp),
                SizedBox(
                  height: 6.h,
                ),
                ReusableText.textWigdet(
                    text: 'Rs ${items.price}',
                    fSize: 16.sp,
                    fw: FontWeight.w500,
                    color: Appcolors.primary)
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: IconButton(
                    alignment: Alignment(0, -0.5.h),
                    onPressed: () {},
                    icon: Icon(
                      Icons.minimize,
                      size: 18.h,
                    )),
              ),
              ReusableText.textWigdet(text: '1'),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 18.h,
                    )),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
