import 'package:batch5pm/SearchScreen.dart';
import 'package:batch5pm/clock_screen.dart';
import 'package:batch5pm/employee_list_screen.dart';
import 'package:batch5pm/food_screen.dart';
import 'package:batch5pm/home_screen.dart';
import 'package:batch5pm/image_save_screen.dart';
import 'package:batch5pm/list_build.dart';
import 'package:batch5pm/location_screen.dart';
import 'package:batch5pm/login_screen.dart';
import 'package:batch5pm/my_map_screen.dart';
import 'package:batch5pm/pagination_list.dart';
import 'package:batch5pm/register_details_screen.dart';
import 'package:batch5pm/register_screen.dart';
import 'package:batch5pm/segmented_button_screen.dart';
import 'package:batch5pm/stream_screen.dart';
import 'package:batch5pm/user_list_screen.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/routes.dart';
import 'package:batch5pm/video_screen.dart';
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
          case routeImageSaveScreen:
            return MaterialPageRoute(builder: (_) => const ImageSaveScreen());
          case routeVideoScreen:
            return MaterialPageRoute(builder: (_) => const MyVidePlayerScreen());
          case routeSearchScreen:
            return MaterialPageRoute(builder: (_) => const SearchScreen());
          case routeGoogleMapScreen:
            return MaterialPageRoute(builder: (_) => const GoogleMapScreen());
          case routeEmployeeListScreen:
            return MaterialPageRoute(builder: (_) => const  EmployeeListScreen());
          case routeLoginScreen:
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          case routeLocationScreen:
            return MaterialPageRoute(builder: (_) => const LocationScreen());
          case routePaginationListScreen:
            return MaterialPageRoute(builder: (_) => const PaginationListScreen());
          case routeUserListScreen:
            return MaterialPageRoute(builder: (_) => const UserListScreen());
          case routeMyStreamScreen:
            return MaterialPageRoute(builder: (_) => const MyStreamScreen());
          case routeRegisterScreen:
            return MaterialPageRoute(builder: (_) => const RegisterScreen());
          case routeRegisterDetailsScreen:
            return MaterialPageRoute(
              builder: (_) => RegisterDetailsScreen(
                arguments: settings.arguments,
              ),
            );
          case routeClockScreen:
            return MaterialPageRoute(builder: (_) => const ClockScreen());
          case routeMySegmentedButtonScreen:
            return MaterialPageRoute(
                builder: (_) => const MySegmentedButtonScreen());
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for ${settings.name}')),
              ),
            );
        }
      },
      onPopPage: (route, result) {
        print('Back button pressed');
        return route.didPop(result);
      },
    );
  }
}
