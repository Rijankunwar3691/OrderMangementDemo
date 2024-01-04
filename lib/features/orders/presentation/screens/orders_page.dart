import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/core/widgets/item_count_button.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/orders/presentation/provider/order_list_provider.dart';

class OrdersPage extends ConsumerStatefulWidget {
  const OrdersPage({super.key});

  @override
  ConsumerState<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(orderListProvider);

    final isLoad = orderState.isLoad;
    final orderList = orderState.orderHistory;
    return Scaffold(
      appBar: AppBarWidget.appBar(title: 'Orders'),
      body: isLoad
          ? const Center(child: CircularProgressIndicator())
          : orderList.isEmpty
              ? Center(
                  child: ReusableText.textWigdet(
                      text: 'No any Orders...',
                      fSize: 22.sp,
                      fw: FontWeight.w500,
                      color: Colors.grey),
                )
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText.textWigdet(
                          text: 'Your Orders',
                          fSize: 20.sp,
                          fw: FontWeight.w600),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: orderList.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: Appcolors.mutedLine,
                              height: 10.h,
                              thickness: 1.5.h,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              key: Key(orderList[index].orderId.toString()),
                              onDismissed: (direction) {
                                ref
                                    .read(orderListProvider.notifier)
                                    .deleteOrder(
                                      orderList[index].orderId!.toInt(),
                                    );
                                ref
                                    .read(orderListProvider.notifier)
                                    .getOrderHistory();
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
                                  width: 80.w,
                                  child: ItemButtonCount(
                                    count: orderList[index].count.toString(),
                                    onPressedMin: () {
                                      ItemModel data = ItemModel(
                                          name: orderList[index].name,
                                          price: orderList[index].price,
                                          id: orderList[index].id,
                                          orderId: orderList[index].orderId,
                                          billPrice: orderList[index].billPrice,
                                          count: orderList[index].count);
                                      ref
                                          .read(orderListProvider.notifier)
                                          .decrementOrder(
                                              orderList[index].count!.toInt(),
                                              orderList[index].orderId!.toInt(),
                                              data);
                                      ref
                                          .read(orderListProvider.notifier)
                                          .getOrderHistory();
                                    },
                                    onPressedAdd: () {
                                      ItemModel data = ItemModel(
                                          name: orderList[index].name,
                                          price: orderList[index].price,
                                          id: orderList[index].id,
                                          orderId: orderList[index].orderId,
                                          billPrice: orderList[index].billPrice,
                                          count: orderList[index].count);
                                      ref
                                          .read(orderListProvider.notifier)
                                          .incrementOrder(
                                              orderList[index].count!.toInt(),
                                              orderList[index].orderId!.toInt(),
                                              data);
                                      ref
                                          .read(orderListProvider.notifier)
                                          .getOrderHistory();
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
                                            text:
                                                orderList[index].id.toString(),
                                            fSize: 14.sp,
                                            fw: FontWeight.w500)
                                      ],
                                    ),
                                  ),
                                ),
                                title: ReusableText.textWigdet(
                                    text: orderList[index].name.toString(),
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
    );
  }
}
