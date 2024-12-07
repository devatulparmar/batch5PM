import 'package:batch5pm/NestedProfileScreen.dart';
import 'package:batch5pm/food_screen.dart';
import 'package:batch5pm/home_screen.dart';
import 'package:batch5pm/login_screen.dart';
import 'package:batch5pm/my_map_screen.dart';
import 'package:batch5pm/nested_screen.dart';
import 'package:batch5pm/register_screen.dart';
import 'package:batch5pm/sales_screen.dart';
import 'package:batch5pm/setting_screen.dart';
import 'package:batch5pm/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int selectedIndex = 0;

  final List _list = const [
    NestedScreen(),
    WebViewScreen(),
    GoogleMapScreen(),
    FoodScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        return;
      },
      child: Scaffold(
        body: _list.elementAt(selectedIndex),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.pink.shade100,
        //   currentIndex: selectedIndex,
        //   // fixedColor: Colors.red,
        //   // unselectedItemColor: Colors.blueAccent,
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   type: BottomNavigationBarType.fixed,
        //   landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        //   items: [
        //     const BottomNavigationBarItem(
        //         icon: Icon(Icons.home),
        //         label: 'Notification',
        //     ),
        //     BottomNavigationBarItem(
        //         icon: Badge(
        //           label: Text('$selectedIndex'),
        //           backgroundColor: Colors.green,
        //           textColor: Colors.black,
        //           child: const Icon(Icons.search),
        //         ),
        //         label: 'Notification',
        //     ),
        //     BottomNavigationBarItem(
        //         icon: Badge(
        //           label: Text('$selectedIndex'),
        //           backgroundColor: Colors.green,
        //           textColor: Colors.black,
        //           child: const Icon(Icons.add),
        //         ),
        //         label: 'Notification',
        //     ),
        //     const BottomNavigationBarItem(
        //         icon: Icon(Icons.favorite_border),
        //         activeIcon: Icon(Icons.favorite),
        //         label: 'Notification',
        //     ),
        //     BottomNavigationBarItem(
        //         icon: Badge(
        //           label: Text('$selectedIndex'),
        //           backgroundColor: Colors.green,
        //           textColor: Colors.black,
        //           child: const Icon(Icons.settings),
        //         ),
        //         label: 'Notification',
        //     ),
        //   ],
        //   onTap: (int? index){
        //     setState(() {
        //       selectedIndex = index ?? 0;
        //     });
        //   },
        // ),

        bottomNavigationBar: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSwatch(accentColor: Colors.green),
          ),
          child: NavigationBar(
            backgroundColor: Colors.blue.shade50,
            selectedIndex: selectedIndex,
            shadowColor: Colors.green,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            elevation: 30,
            surfaceTintColor: Colors.green,
            animationDuration: const Duration(milliseconds: 500),
            onDestinationSelected: (int? index) {
              setState(() => selectedIndex = index ?? 0);
            },
            destinations: [
              const NavigationDestination(
                  icon: Icon(Icons.home), label: 'home'),
              const NavigationDestination(
                  icon: Icon(Icons.search), label: 'Search'),
              const NavigationDestination(icon: Icon(Icons.add), label: 'Post'),
              NavigationDestination(
                icon: Badge(
                  label: Text('$selectedIndex'),
                  backgroundColor: Colors.green,
                  textColor: Colors.black,
                  child: const Icon(Icons.shopping_cart),
                ),
                label: 'Notification',
              ),
              const NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
