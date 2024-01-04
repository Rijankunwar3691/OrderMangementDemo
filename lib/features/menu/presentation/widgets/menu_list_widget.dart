import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/resources/assets_manager.dart';
import 'package:hoteldemo/core/resources/colors_manager.dart';
import 'package:hoteldemo/core/widgets/item_count_button.dart';
import 'package:hoteldemo/core/widgets/reusable_text.dart';
import 'package:hoteldemo/features/menu/domain/model/menu_model.dart';
import 'package:hoteldemo/features/menu/presentation/provider/menu_toogle_provider.dart';
import 'package:hoteldemo/features/menu/presentation/provider/total_price_provider.dart';

class MenuListWidget extends ConsumerStatefulWidget {
  final ItemModel items;
  const MenuListWidget({super.key, required this.items});

  @override
  ConsumerState<MenuListWidget> createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends ConsumerState<MenuListWidget> {
  @override
  Widget build(BuildContext context) {
    final menuCount = ref.watch(menuCountProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60.h,
          width: 60.w,
          child: Image.asset(
            ImageAssets.foodIcon,
            fit: BoxFit.cover,
          ),
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
                  text: widget.items.name.toString(),
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
                  text: widget.items.price.toString(),
                  fSize: 16.sp,
                  fw: FontWeight.w500,
                  color: Appcolors.primary)
            ],
          ),
        ),
        Expanded(
          child: ItemButtonCount(
            count: menuCount[widget.items.name]?['count'].toString(),
            onPressedMin: () {
              ref.read(menuCountProvider.notifier).decrementCount(
                  widget.items.name.toString(), widget.items.price!.toInt());
              ref
                  .read(totalPriceProvider.notifier)
                  .calculateTotalPrice(menuCount);
            },
            onPressedAdd: () {
              ref.read(menuCountProvider.notifier).incrementCount(
                  widget.items.name.toString(), widget.items.price!.toInt());
              ref
                  .read(totalPriceProvider.notifier)
                  .calculateTotalPrice(menuCount);
            },
          ),
        )
      ],
    );
  }
}
