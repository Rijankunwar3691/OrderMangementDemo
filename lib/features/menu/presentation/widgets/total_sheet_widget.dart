import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/features/menu/presentation/provider/menu_toogle_provider.dart';
import 'package:hoteldemo/features/menu/presentation/provider/total_price_provider.dart';
import 'package:hoteldemo/features/orders/presentation/provider/order_list_provider.dart';
import 'package:hoteldemo/features/orders/presentation/screens/order_summary_page.dart';

class TotalSheetWidget extends ConsumerStatefulWidget {
  final int orderCount;
  final String tableNo;
  const TotalSheetWidget(
      {super.key, required this.orderCount, required this.tableNo});

  @override
  ConsumerState<TotalSheetWidget> createState() => _TotalSheetWidgetState();
}

class _TotalSheetWidgetState extends ConsumerState<TotalSheetWidget> {
  @override
  Widget build(BuildContext context) {
    final menuCount = ref.watch(menuCountProvider);
    final totalPriceState = ref.watch(totalPriceProvider);
 
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
                    text: '${widget.orderCount} Item',
                    fSize: 16.sp,
                    fw: FontWeight.w500),
                Container(
                  height: 35.h,
                  width: 2.w,
                  color: Appcolors.accentOrange,
                ),
                ReusableText.textWigdet(
                  color: Appcolors.primary,
                  text: 'Rs ${totalPriceState.totalPrice.toString()}',
                  fSize: 16.sp,
                  fw: FontWeight.w500,
                )
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                ref
                    .read(orderListProvider.notifier)
                    .getOrderList(menuCount, widget.tableNo);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OrderSummaryPage(tableNo: widget.tableNo),
                    ));
              },
              child: const Text('View Order'))
        ],
      ),
    );
  }
}
