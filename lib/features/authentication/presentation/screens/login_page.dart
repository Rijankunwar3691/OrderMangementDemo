import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/features/authentication/presentation/provider/validator_provider.dart';
import 'package:hoteldemo/features/orders/presentation/provider/order_list_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.appBar(title: 'Login'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Image.asset(ImageAssets.waiterImage1, height: 200.h),
                SizedBox(
                  height: 20.h,
                ),
                ReusableText.textWigdet(
                    text: 'Orders, Simplified',
                    fSize: 28.sp,
                    fw: FontWeight.bold,
                    color: Appcolors.primary),
                SizedBox(
                  height: 5.h,
                ),
                ReusableText.textWigdet(
                    text: 'Login to enjoy one-stop solution.',
                    fSize: 26.sp,
                    fw: FontWeight.w600,
                    color: Appcolors.blackPrimaryMinus2),
                SizedBox(
                  height: 45.h,
                ),
                BuildEmailTextFormField(
                  controller: emailController,
                  labelText: 'Email',
                  hintText: 'username',
                  validator: (p0) =>
                      ref.read(validatorProvider.notifier).validateEmail(p0),
                  radius: 30.r,
                ),
                SizedBox(
                  height: 40.h,
                ),
                BuildPasswordTextFormField(
                  controller: passController,
                  hintText: 'password',
                  radius: 30.r,
                  validator: (p0) =>
                      ref.read(validatorProvider.notifier).validatePassword(p0),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: SizedBox(
                    width: 180.w,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ref
                                .read(orderListProvider.notifier)
                                .getOrderHistory();
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.mainPage);
                          }
                        },
                        child: const Text('Login')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
