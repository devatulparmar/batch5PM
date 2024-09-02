
import 'package:batch5pm/food_screen.dart';
import 'package:batch5pm/home_screen.dart';
import 'package:batch5pm/login_screen.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/routes.dart';
import 'package:flutter/material.dart';

class NestedScreen extends StatefulWidget {
  const NestedScreen({Key? key}) : super(key: key);

  @override
  State<NestedScreen> createState() => _NestedScreenState();
}

class _NestedScreenState extends State<NestedScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const  HomeScreen());
          case routeFoodScreen:
            return MaterialPageRoute(builder: (_) => const  FoodScreen());
          case routeLoginScreen:
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for ${settings.name}')),
              ),
            );
        }
      },
    );
  }
}
