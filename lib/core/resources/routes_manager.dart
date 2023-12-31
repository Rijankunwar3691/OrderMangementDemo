import 'package:flutter/material.dart';
import 'package:hoteldemo/features/menu/presentation/screens/select_order_page.dart';
import 'package:hoteldemo/features/orders/presentation/screens/order_summary_page.dart';

class AppRoutes {
  static const String menuRoute = '/menu';
  static const String orderSummaryPage = '/orderSummary';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings,) {
    switch (settings.name) {
      case AppRoutes.menuRoute:
        return MaterialPageRoute(
          builder: (context) =>  const SelectOrderPage(),
        );

      case AppRoutes.orderSummaryPage:
        return MaterialPageRoute(
          builder: (context) => const OrderSummaryPage(),
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
