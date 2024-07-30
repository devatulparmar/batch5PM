import 'package:batch5pm/login_screen.dart';
import 'package:batch5pm/register_details_screen.dart';
import 'package:batch5pm/register_screen.dart';
import 'package:batch5pm/sales_screen.dart';
import 'package:batch5pm/screen1.dart';
import 'package:batch5pm/screen2.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:flutter/material.dart';

class MyAppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Screen1());
      case routeScreen2:
        return MaterialPageRoute(builder: (_) => const Screen2());
      case routeLoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeRegisterScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case routeSalesScreen:
        return MaterialPageRoute(builder: (_) => const SaleScreen());
      case routeRegisterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => RegisterDetailsScreen(
              arguments: settings.arguments,
            ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
