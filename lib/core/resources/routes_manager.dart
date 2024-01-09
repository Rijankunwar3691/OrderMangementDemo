import 'package:flutter/material.dart';
import 'package:hoteldemo/features/authentication/presentation/screens/login_page.dart';
import 'package:hoteldemo/features/bottom%20navbar/bottom_navbar.dart';
import 'package:hoteldemo/features/home/presentation/screens/home_page.dart';
import 'package:hoteldemo/features/menu/presentation/screens/select_order_page.dart';
import 'package:hoteldemo/features/orders/presentation/screens/order_summary_page.dart';
import 'package:hoteldemo/features/search/presentation/screens/menu_search_page.dart';
import 'package:hoteldemo/features/search/presentation/screens/table_search_page.dart';
import 'package:hoteldemo/features/table%20detail/presentation/screens/table_detail_page.dart';

class AppRoutes {
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String tableDetailRoute = '/tableDetail';
  static const String tablesearchRoute = '/tableSearch';
  static const String menusearchRoute = '/menuSearch';

  static const String mainPage = '/mainPage';

  static const String menuRoute = '/menu';
  static const String orderSummaryPage = '/orderSummary';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case AppRoutes.menuRoute:
        return MaterialPageRoute(
          builder: (context) => const SelectOrderPage(),
        );

      case AppRoutes.orderSummaryPage:
        return MaterialPageRoute(
          builder: (context) => const OrderSummaryPage(),
        );

      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      case AppRoutes.mainPage:
        return MaterialPageRoute(
          builder: (context) => const CustomButtomBar(),
        );

      case AppRoutes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case AppRoutes.tableDetailRoute:
        return MaterialPageRoute(
          builder: (context) => const TableDetailPage(),
        );
      case AppRoutes.tablesearchRoute:
        return MaterialPageRoute(
          builder: (_) => const TableSearchPage(),
        );
      case AppRoutes.menusearchRoute:
        return MaterialPageRoute(
          builder: (_) => const MenuSearchPage(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('no routes found'),
          ),
          body: const Text("no routes found")),
    );
  }
}
