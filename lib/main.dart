import 'package:batch5pm/my_bottom_bar.dart';
import 'package:batch5pm/services/notification_service.dart';
import 'package:batch5pm/services/push_notification_service.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/device_info.dart';
import 'package:batch5pm/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await NotificationService().init();
  await NotificationService().isAndroidPermissionGranted();
  await NotificationService().requestPermissions();
  await NotificationService().configureDidReceiveLocalNotificationSubject();
  await NotificationService().configureSelectNotificationSubject();
  await PushNotificationService().setupInteractedMessage();
  DeviceInformation().getDeviceInfo();
  runApp(
    MaterialApp(
      navigatorKey: globalNavigationKey,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: MyAppRouter.generateRoute,
      // routes: {
      //   routeScreen1: (BuildContext context) => const Screen1(),
      //   routeScreen2: (BuildContext context) => const Screen2(),
      // },
      // debugShowCheckedModeBanner: false,
      home: const MyBottomBar(),
    ),
  );
}
