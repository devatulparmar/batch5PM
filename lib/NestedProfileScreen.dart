
import 'package:batch5pm/food_screen.dart';
import 'package:batch5pm/login_screen.dart';
import 'package:batch5pm/register_details_screen.dart';
import 'package:batch5pm/register_screen.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/routes.dart';
import 'package:flutter/material.dart';

class NestedProfileScreen extends StatefulWidget {
  const NestedProfileScreen({Key? key}) : super(key: key);

  @override
  State<NestedProfileScreen> createState() => _NestedProfileScreenState();
}

class _NestedProfileScreenState extends State<NestedProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const  RegisterScreen());
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
      },
    );
  }
}
