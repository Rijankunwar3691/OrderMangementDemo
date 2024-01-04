import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/features/menu/presentation/provider/menu_list_provider.dart';
import 'package:hoteldemo/features/menu/presentation/widgets/menu_list_widget.dart';
import 'package:hoteldemo/features/search/presentation/provider/search_result_provider.dart';

class MenuSearchPage extends ConsumerStatefulWidget {
  const MenuSearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MenuSearchPageState();
}

class _MenuSearchPageState extends ConsumerState<MenuSearchPage> {
  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchResultProvider);
    final searchResult = searchState.itemSearchResult;
    final menuState = ref.watch(menuListProvider);
    final itemList = menuState.menuList;
    return Scaffold(
      appBar: AppBarWidget.appBar(title: 'Search'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        child: Column(
          children: [
            BuildTextFormField(
              enabled: true,
              hintText: 'Search for food item',
              radius: 40.r,
              onChanged: (p0) {
                ref
                    .read(searchResultProvider.notifier)
                    .filterItemSearch(p0, itemList);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchResult.length,
                    itemBuilder: (context, index) {
                      return MenuListWidget(items: searchResult[index]);
                    }))
          ],
        ),
      ),
    );
  }
}
