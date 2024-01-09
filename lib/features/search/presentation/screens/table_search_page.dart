import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/features/home/presentation/provider/table_no_provider.dart';
import 'package:hoteldemo/features/home/presentation/provider/tables_list_provider.dart';
import 'package:hoteldemo/features/menu/presentation/provider/menu_list_provider.dart';
import 'package:hoteldemo/features/orders/presentation/provider/order_list_provider.dart';
import 'package:hoteldemo/features/search/presentation/provider/search_result_provider.dart';
import 'package:hoteldemo/features/table%20detail/presentation/providers/table_detail_provider.dart';

class TableSearchPage extends ConsumerStatefulWidget {
  const TableSearchPage({super.key});

  @override
  ConsumerState<TableSearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<TableSearchPage> {
  @override
  Widget build(BuildContext context) {
    final tableList = ref.watch(tableListProvider);
    final searchState = ref.watch(searchResultProvider);
    final searchResult = searchState.tableSearchResult;
    final orderState = ref.watch(orderListProvider);
    final orderList = orderState.orderHistory;

    return Scaffold(
      appBar: AppBarWidget.appBar(title: 'Search'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        child: Column(
          children: [
            Expanded(
              child: BuildTextFormField(
                enabled: true,
                hintText: 'Search by table number',
                radius: 30.r,
                onChanged: (p0) => ref
                    .read(searchResultProvider.notifier)
                    .filterTableSearch(p0, tableList),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
                flex: 7,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: searchResult.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemBuilder: (context, index) {
                    if (orderList.any(
                        (element) => element.id == searchResult[index].id)) {
                      return GestureDetector(
                          onTap: () {
                            ref
                                .read(orderListProvider.notifier)
                                .getOrderHistory()
                                .then((_) {
                              ref
                                  .read(tableDetailProvider.notifier)
                                  .filterTableData(
                                      ref.read(orderListProvider).orderHistory,
                                      searchResult[index].id.toString());

                              Navigator.pushNamed(
                                  context, AppRoutes.tableDetailRoute);
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Appcolors.accentOrange
                                        .withOpacity(0.4)),
                                child: const Icon(Icons.table_restaurant),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Appcolors.accentOrange),
                                    child: ReusableText.textWigdet(
                                        text: 'Occupied', fw: FontWeight.w500),
                                  ),
                                  ReusableText.textWigdet(
                                      text:
                                          'Table No. ${searchResult[index].id.toString()}',
                                      fSize: 18.sp,
                                      fw: FontWeight.bold),
                                ],
                              )
                            ],
                          ));
                    } else {
                      return GestureDetector(
                          onTap: () {
                            ref.read(menuListProvider.notifier).getMenuList();
                            ref.read(tableNoProvider.notifier).state =
                                searchResult[index].id.toString();
                            Navigator.pushNamed(context, AppRoutes.menuRoute);
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Appcolors.accentOrange
                                        .withOpacity(0.4)),
                                child: const Icon(Icons.table_restaurant),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Appcolors.mutedLine),
                                    child: ReusableText.textWigdet(
                                        text: 'Avaiable', fw: FontWeight.w500),
                                  ),
                                  ReusableText.textWigdet(
                                      text:
                                          'Table No. ${searchResult[index].id.toString()}',
                                      fSize: 18.sp,
                                      fw: FontWeight.bold),
                                ],
                              )
                            ],
                          ));
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
