import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';

import 'package:hoteldemo/features/home/presentation/provider/tables_list_provider.dart';
import 'package:hoteldemo/features/home/presentation/widgets/table_container.dart';
import 'package:hoteldemo/features/menu/presentation/provider/menu_list_provider.dart';
import 'package:hoteldemo/features/menu/presentation/screens/select_order_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final tableList = ref.watch(tableListProvider);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Image.asset(ImageAssets.profileImage),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  ReusableText.textWigdet(
                      text: 'Hi Rijan!', fSize: 20.sp, fw: FontWeight.bold),
                  const Spacer(),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.notifications))
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                  height: 45.h,
                  child: BuildTextFormField(
                    hintText: 'Search by table number',
                    radius: 30.r,
                  )),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 8.w),
                  itemCount: tableList.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        ref.read(menuListProvider.notifier).getMenuList();
                        Navigator.pushNamed(context, AppRoutes.menuRoute);
                      },
                      child: TableContainer(
                          tableNo: tableList[index].id.toString(),
                          isOccupied: tableList[index].isOccupied.toString())),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
