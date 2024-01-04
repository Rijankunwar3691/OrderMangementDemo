import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/core/widgets/item_count_button.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/orders/presentation/provider/order_list_provider.dart';
import 'package:hoteldemo/features/table%20status/presentation/providers/table_detail_provider.dart';

class TableDetailPage extends ConsumerStatefulWidget {
  const TableDetailPage({super.key});

  @override
  ConsumerState<TableDetailPage> createState() => _TableDetailPageState();
}

class _TableDetailPageState extends ConsumerState<TableDetailPage> {
  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(orderListProvider);

    final tableDetail = ref.watch(tableDetailProvider);
    bool isLoad = orderState.isLoad;

    return Scaffold(
      appBar: AppBarWidget.appBar(title: 'Table Detail'),
      body: isLoad
          ? const Center(child: CircularProgressIndicator())
          : tableDetail.isEmpty
              ? Center(
                  child: ReusableText.textWigdet(
                      text: 'No any Orders...',
                      fSize: 28.sp,
                      fw: FontWeight.bold,
                      color: Appcolors.greyInformation))
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ReusableText.textWigdet(
                              text: '# Table ${tableDetail[0].id}',
                              fSize: 19.sp,
                              fw: FontWeight.w600,
                              color: Appcolors.blackPrimary),
                          SizedBox(
                            width: 80.w,
                          ),
                          ReusableText.textWigdet(
                              text: 'Guest 2',
                              fSize: 19.sp,
                              fw: FontWeight.w500,
                              color: Appcolors.greyInformation),
                          SizedBox(
                            width: 80.w,
                          ),
                          ReusableText.textWigdet(
                              text: 'Dine In',
                              fSize: 19.sp,
                              fw: FontWeight.w500,
                              color: Appcolors.greyInformation),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 1.h,
                        color: Appcolors.accentOrange,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: tableDetail.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: Appcolors.mutedLine,
                              height: 10.h,
                              thickness: 1.5.h,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              key: Key(tableDetail[index].orderId.toString()),
                              onDismissed: (direction) {
                                ref
                                    .read(orderListProvider.notifier)
                                    .deleteOrder(
                                      tableDetail[index].orderId!.toInt(),
                                    );
                                ref
                                    .read(orderListProvider.notifier)
                                    .getOrderHistory()
                                    .then((_) {
                                  ref
                                      .read(tableDetailProvider.notifier)
                                      .filterTableData(
                                          ref
                                              .read(orderListProvider)
                                              .orderHistory,
                                          tableDetail[index].id!.toString());
                                });
                              },
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 10.w),
                                color: Appcolors.primary,
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ),
                              ),
                              child: ListTile(
                                trailing: SizedBox(
                                  width: 85.w,
                                  child: ItemButtonCount(
                                    count: tableDetail[index].count.toString(),
                                    onPressedMin: () {
                                      ItemModel data = ItemModel(
                                          name: tableDetail[index].name,
                                          price: tableDetail[index].price,
                                          id: tableDetail[index].id,
                                          orderId: tableDetail[index].orderId,
                                          billPrice:
                                              tableDetail[index].billPrice,
                                          count: tableDetail[index].count);
                                      ref
                                          .read(orderListProvider.notifier)
                                          .decrementOrder(
                                              tableDetail[index].count!.toInt(),
                                              tableDetail[index]
                                                  .orderId!
                                                  .toInt(),
                                              data);
                                      ref
                                          .read(orderListProvider.notifier)
                                          .getOrderHistory()
                                          .then((_) {
                                        ref
                                            .read(tableDetailProvider.notifier)
                                            .filterTableData(
                                                ref
                                                    .read(orderListProvider)
                                                    .orderList,
                                                tableDetail[0].id.toString());
                                      });
                                    },
                                    onPressedAdd: () {
                                      ItemModel data = ItemModel(
                                          name: tableDetail[index].name,
                                          price: tableDetail[index].price,
                                          id: tableDetail[index].id,
                                          orderId: tableDetail[index].orderId,
                                          billPrice:
                                              tableDetail[index].billPrice,
                                          count: tableDetail[index].count);
                                      ref
                                          .read(orderListProvider.notifier)
                                          .incrementOrder(
                                              tableDetail[index].count!.toInt(),
                                              tableDetail[index]
                                                  .orderId!
                                                  .toInt(),
                                              data);
                                      ref
                                          .read(orderListProvider.notifier)
                                          .getOrderHistory()
                                          .then((_) {
                                        ref
                                            .read(tableDetailProvider.notifier)
                                            .filterTableData(
                                                ref
                                                    .read(orderListProvider)
                                                    .orderList,
                                                tableDetail[0].id.toString());
                                      });
                                    },
                                  ),
                                ),
                                leading: Container(
                                  height: 50.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Appcolors.accentOrange
                                          .withOpacity(0.4)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.table_restaurant),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        ReusableText.textWigdet(
                                            text: tableDetail[index]
                                                .id
                                                .toString(),
                                            fSize: 14.sp,
                                            fw: FontWeight.w500)
                                      ],
                                    ),
                                  ),
                                ),
                                title: ReusableText.textWigdet(
                                    text: tableDetail[index].name.toString(),
                                    fSize: 16.sp,
                                    fw: FontWeight.w600),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.primary,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, AppRoutes.menuRoute),
      ),
    );
  }
}
