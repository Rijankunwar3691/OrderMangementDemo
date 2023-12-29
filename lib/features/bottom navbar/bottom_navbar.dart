import 'package:flutter/material.dart';
import 'package:hoteldemo/core/resources/colors_manager.dart';
import 'package:hoteldemo/features/home/presentation/screens/home_page.dart';
import 'package:hoteldemo/features/orders/presentation/screens/orders.dart';
import 'package:hoteldemo/features/profile/presentation/screens/profile_page.dart';

class CustomButtomBar extends StatefulWidget {
  const CustomButtomBar({super.key});

  @override
  State<CustomButtomBar> createState() => _CustomButtomBarState();
}

class _CustomButtomBarState extends State<CustomButtomBar> {
  int _selectedIndex = 0;
  final List<Widget> pages = [
    const HomePage(),
    const OrdersPage(),
    const ProfilePage()
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
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: 'Profile'),
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
