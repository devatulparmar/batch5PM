import 'package:batch5pm/login_screen.dart';
import 'package:batch5pm/sales_screen.dart';
import 'package:batch5pm/screen1.dart';
import 'package:batch5pm/screen2.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:flutter/material.dart';

class MyAppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SaleScreen());
      case routeScreen2:
        return MaterialPageRoute(builder: (_) => const Screen2());
      case routeLoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeLoginScreen:
        return MaterialPageRoute(builder: (_) => const SaleScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
