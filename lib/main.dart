
import 'package:batch5pm/home_screen.dart';
import 'package:batch5pm/screen2.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
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