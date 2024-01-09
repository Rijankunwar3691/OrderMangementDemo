import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/core/widgets/item_count_button.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/menu/presentation/provider/total_price_provider.dart';
import 'package:hoteldemo/features/orders/presentation/provider/order_list_provider.dart';
import 'package:hoteldemo/features/table%20detail/presentation/providers/table_detail_provider.dart';

class TableDetailPage extends ConsumerStatefulWidget {
  const TableDetailPage({super.key});

  @override
  ConsumerState<TableDetailPage> createState() => _TableDetailPageState();
}

class _TableDetailPageState extends ConsumerState<TableDetailPage> {
  List items = ['Card', 'Cash', 'QR'];
  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(orderListProvider);

    final tableDetail = ref.watch(tableDetailProvider);
    final totalPriceState = ref.watch(totalPriceProvider);
    final totalBill = totalPriceState.totalBill;
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 2,
                            child: ReusableText.textWigdet(
                                text: '# Table ${tableDetail[0].id}',
                                fSize: 19.sp,
                                fw: FontWeight.w600,
                                color: Appcolors.blackPrimary),
                          ),
                          Expanded(
                            flex: 2,
                            child: ReusableText.textWigdet(
                                text: 'Guest 2',
                                fSize: 19.sp,
                                fw: FontWeight.w500,
                                color: Appcolors.greyInformation),
                          ),
                          Expanded(
                            flex: 1,
                            child: ReusableText.textWigdet(
                                text: 'Dine In',
                                fSize: 19.sp,
                                fw: FontWeight.w500,
                                color: Appcolors.greyInformation),
                          ),
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
                                                    .orderHistory,
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
                                                    .orderHistory,
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
                      SizedBox(
                        width: 250.h,
                        child: ElevatedButton(
                            onPressed: () {
                              PaySheet(context, totalBill, tableDetail);
                            },
                            child: Text('Pay')),
                      )
                    ],
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.accentOrange,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, AppRoutes.menuRoute),
      ),
    );
  }

  Future<dynamic> PaySheet(
      BuildContext context, double totalBill, List<ItemModel> tableDetail) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              left: 18.w,
              right: 18.w,
              top: 18.h,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReusableText.textWigdet(
                  text: 'Total Amount Due ', fSize: 18.sp, fw: FontWeight.w400),
              ReusableText.textWigdet(
                  text: totalBill.toString(),
                  color: Appcolors.primary,
                  fSize: 20.sp,
                  fw: FontWeight.bold),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  ReusableText.textWigdet(
                      text: 'Choose Payement Method: ', fSize: 16.sp),
                  DropdownMenu(
                    textStyle: TextStyle(color: Colors.blue),
                    inputDecorationTheme:
                        InputDecorationTheme(border: InputBorder.none),
                    initialSelection: items[1],
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: items[0], label: items[0]),
                      DropdownMenuEntry(value: itemsgit [1], label: items[1]),
                      DropdownMenuEntry(value: items[2], label: items[2]),
                    ],
                  ),
                ],
              ),
              BuildEmailTextFormField(
                hintText: '0.000',
                radius: 15.r,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(tableDetailProvider.notifier)
                          .clearTable(tableDetail[0].id);
                      ref.read(orderListProvider.notifier).getOrderHistory();
                      Navigator.pop(context);
                    },
                    child: Text('Pay Now')),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
