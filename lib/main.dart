import 'package:batch5pm/home_screen.dart';
import 'package:batch5pm/screen2.dart';
import 'package:batch5pm/services/notification_service.dart';
import 'package:batch5pm/services/push_notification_service.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/device_info.dart';
import 'package:batch5pm/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:locked_shared_preferences/locked_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAB25l3atbOYReEfwWZCbTjL0ruXahpAiw",
      appId: "1:161121444387:android:0aba758e8789b819d1c796",
      messagingSenderId: "",
      projectId: "batch5pm-6a47b",
    ),
  );
  await NotificationService().init();
  await NotificationService().isAndroidPermissionGranted();
  await NotificationService().requestPermissions();
  await NotificationService().configureDidReceiveLocalNotificationSubject();
  await NotificationService().configureSelectNotificationSubject();
  await PushNotificationService().setupInteractedMessage();
  // await LockedSharedPreferences.getInstance();

  DeviceInformation().getDeviceInfo();
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
