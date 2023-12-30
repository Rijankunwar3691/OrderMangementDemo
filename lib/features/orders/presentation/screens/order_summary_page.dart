import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/menu/presentation/provider/menu_count_provider.dart';
import 'package:hoteldemo/features/menu/presentation/widgets/menu_list_widget.dart';

class OrderSummaryPage extends ConsumerStatefulWidget {
  const OrderSummaryPage({super.key});

  @override
  ConsumerState<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends ConsumerState<OrderSummaryPage> {
  @override
  Widget build(BuildContext context) {
    final orderList = ref.watch(menuCountProvider);
    return Scaffold(
      appBar: AppBarWidget.appBar(title: 'Order Summary'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Appcolors.accentOrange),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText.textWigdet(
                          text: 'Table', fSize: 16.sp, fw: FontWeight.w500),
                      SizedBox(
                        height: 5.h,
                      ),
                      ReusableText.textWigdet(
                          text: '3B', fSize: 18.sp, fw: FontWeight.w600),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText.textWigdet(
                          text: 'Guest 2',
                          fSize: 16.sp,
                          fw: FontWeight.w500,
                          color: Appcolors.blackPrimaryMinus2),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                            color: Appcolors.accentOrange,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: ReusableText.textWigdet(
                            text: 'Tables', fSize: 16.sp, fw: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: 380.h,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsetsDirectional.only(
                      bottom: 10.h,
                    ),
                    height: 1.5.h,
                    width: double.infinity,
                    color: Appcolors.mutedLine,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return MenuListWidget(
                      items: ItemModel(name: 'alooo', price: 500, id: '55'));
                },
              ),
            ),
            Divider(
              color: Appcolors.mutedLine,
              height: 1.h,
              thickness: 1.5.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 120.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.accentOrange),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.add_outlined, size: 20.h),
                        SizedBox(
                          width: 5.w,
                        ),
                        ReusableText.textWigdet(
                            text: 'Add Item',
                            color: Colors.white,
                            fSize: 14.sp,
                            fw: FontWeight.w600),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Total ',
                            style: TextStyle(
                                color: Appcolors.greyInformation,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(
                              text: ' 2000',
                              style: TextStyle(
                                  color: Appcolors.primary,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500))
                        ])),
                    SizedBox(
                      height: 10.h,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Taxes ',
                            style: TextStyle(
                                color: Appcolors.greyInformation,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                            children: [
                          TextSpan(
                              text: ' 20',
                              style: TextStyle(
                                  color: Appcolors.primary,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600))
                        ])),
                  ],
                )
              ],
            ),
            Divider(
              color: Appcolors.mutedLine,
              height: 30.h,
              thickness: 1.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ReusableText.textWigdet(
                    text: 'Total Bill Amount',
                    fSize: 14.sp,
                    color: Appcolors.greyInformation,
                    fw: FontWeight.w500),
                SizedBox(
                  width: 10.w,
                ),
                ReusableText.textWigdet(
                    text: '2000',
                    fSize: 18.sp,
                    color: Appcolors.primary,
                    fw: FontWeight.w600),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Confirm Order')))
          ],
        ),
      ),
    );
  }
}
