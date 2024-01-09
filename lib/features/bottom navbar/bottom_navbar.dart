import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoteldemo/core/export.dart';
import 'package:hoteldemo/features/authentication/presentation/screens/login_page.dart';
import 'package:hoteldemo/features/home/presentation/screens/home_page.dart';
import 'package:hoteldemo/features/orders/presentation/provider/order_list_provider.dart';
import 'package:hoteldemo/features/orders/presentation/screens/orders_page.dart';

class CustomButtomBar extends ConsumerStatefulWidget {
  const CustomButtomBar({super.key});

  @override
  ConsumerState<CustomButtomBar> createState() => _CustomButtomBarState();
}

class _CustomButtomBarState extends ConsumerState<CustomButtomBar> {
  int _selectedIndex = 0;
  final List<Widget> pages = [
    const HomePage(),
    const OrdersPage(),
    // const ProfilePage(),
    const LoginPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Appcolors.primary,
        unselectedItemColor: Colors.redAccent,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
          switch (_selectedIndex) {
            case 0:
              ref.read(orderListProvider.notifier).getOrderHistory();

              break;
            case 1:
              ref.read(orderListProvider.notifier).getOrderHistory();

              break;

            case 2:
              Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);

              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.table_restaurant,
              ),
              label: 'Tables'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.toc,
              ),
              label: 'Orders'),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.account_circle,
          //     ),
          //     label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.logout,
              ),
              label: 'Log out'),
        ],
      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}
