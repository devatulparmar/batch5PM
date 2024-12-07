import 'package:batch5pm/login_screen.dart';
import 'package:batch5pm/my_bottom_bar.dart';
import 'package:batch5pm/register_details_screen.dart';
import 'package:batch5pm/register_screen.dart';
import 'package:batch5pm/sales_screen.dart';
import 'package:batch5pm/screen2.dart';
import 'package:batch5pm/food_screen.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:flutter/material.dart';

class MyAppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyBottomBar());
      case routeScreen2:
        return MaterialPageRoute(builder: (_) => const Screen2());
      case routeLoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeRegisterScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case routeSalesScreen:
        return MaterialPageRoute(builder: (_) => const SaleScreen());
        case routeFoodScreen:
        return MaterialPageRoute(builder: (_) => const FoodScreen());
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
