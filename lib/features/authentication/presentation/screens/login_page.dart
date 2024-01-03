import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/features/orders/presentation/provider/order_list_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.appBar(title: 'Login'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Image.asset(ImageAssets.waiterImage, height: 300.h),
              SizedBox(
                height: 50.h,
              ),
              BuildTextFormField(
                hintText: 'username',
                radius: 30.r,
              ),
              SizedBox(
                height: 40.h,
              ),
              BuildTextFormField(
                hintText: 'password',
                radius: 30.r,
              ),
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: SizedBox(
                  width: 180.w,
                  child: ElevatedButton(
                      onPressed: () {
                        ref.read(orderListProvider.notifier).getOrderHistory();
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.mainPage);
                      },
                      child: const Text('Login')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
