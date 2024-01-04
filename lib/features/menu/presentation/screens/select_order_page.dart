import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/features/home/presentation/provider/table_no_provider.dart';
import 'package:hoteldemo/features/menu/presentation/provider/menu_toogle_provider.dart';
import 'package:hoteldemo/features/menu/presentation/provider/menu_list_provider.dart';
import 'package:hoteldemo/features/menu/presentation/widgets/menu_list_widget.dart';
import 'package:hoteldemo/features/menu/presentation/widgets/total_sheet_widget.dart';

class SelectOrderPage extends ConsumerStatefulWidget {
  const SelectOrderPage({super.key});

  @override
  ConsumerState<SelectOrderPage> createState() => _SelectOrderPageState();
}

class _SelectOrderPageState extends ConsumerState<SelectOrderPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Widget> _tabs = [
    const FittedBox(
      child: Text(
        'All Categories',
      ),
    ),
    const Text('Veg'),
    const Text('Non-Veg'),
    const Text('Drinks'),
  ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menuListState = ref.watch(menuListProvider);
    final menuList = menuListState.menuList;
    final vegList = menuListState.veg;
    final nonVegList = menuListState.nonVeg;
    final drinks = menuListState.drinks;

    final menuCount = ref.watch(menuCountProvider);

    final tableNo = ref.watch(tableNoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.menusearchRoute);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: ReusableText.textWigdet(
                      text: '# Table $tableNo',
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
            TabBar(
              tabs: _tabs,
              controller: tabController,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                ListView.separated(
                  itemCount: menuList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return MenuListWidget(
                      items: menuList[index],
                    );
                  },
                ),
                ListView.separated(
                  itemCount: vegList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return MenuListWidget(
                      items: vegList[index],
                    );
                  },
                ),
                ListView.separated(
                  itemCount: nonVegList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return MenuListWidget(
                      items: nonVegList[index],
                    );
                  },
                ),
                ListView.separated(
                  itemCount: drinks.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return MenuListWidget(
                      items: drinks[index],
                    );
                  },
                ),
              ]),
            )
          ],
        ),
      ),
      bottomSheet: menuCount.isEmpty
          ? const SizedBox()
          : TotalSheetWidget(orderCount: menuCount.length, tableNo: tableNo),
    );
  }
}
