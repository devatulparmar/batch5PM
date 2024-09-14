
import 'package:batch5pm/home_screen.dart';
import 'package:batch5pm/screen2.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:locked_shared_preferences/locked_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LockedSharedPreferences.getInstance();
  runApp(
    MaterialApp(
      navigatorKey: globalNavigationKey,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyAppRouter.generateRoute,
      // routes: {
      //   routeScreen1: (BuildContext context) => const Screen1(),
      //   routeScreen2: (BuildContext context) => const Screen2(),
      // },
      // debugShowCheckedModeBanner: false,
      // home: const Screen1(),
    ),
  );
}