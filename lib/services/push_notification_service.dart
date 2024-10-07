import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:batch5pm/services/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('onBackgroundMessage called');
  if (message.notification == null) {
    print('if called');
    NotificationService().showNotifications(
        title: message.data["title"],
        description: message.data["description"],
      messageData: message.data,
    );
  } else {
    print('else called');
    print('data ${jsonEncode(message.data)}');
    NotificationService().showNotifications(
        title: message.notification?.title,
        description: message.notification?.body,
      messageData: message.data,
    );
  }
}

class PushNotificationService {
  Future<void> setupInteractedMessage() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    final messagingInstance = FirebaseMessaging.instance;

    NotificationSettings settings = await messagingInstance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final token = await messagingInstance.getToken();
      debugPrint('FCM token :: $token');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('onMessage called');

        if (message.notification == null) {
          debugPrint('onMessage ::  ${json.encode(message.data)}');
          NotificationService().showNotifications(
              title: message.data["title"],
              description: message.data["description"],
              messageData: message.data);
        } else {
          debugPrint('onMessage notification :: ${json.encode(message.data)}');
          NotificationService().showNotifications(
              title: message.notification?.title,
              description: message.notification?.body,
              messageData: message.data);
        }
      });

      messagingInstance.getInitialMessage().then((RemoteMessage? message) {
        print('getInitialMessage called');
        if (message != null) {
          if (message.notification == null) {
            NotificationService().showNotifications(
                title: message.data["title"],
                description: message.data["description"],
                messageData: message.data);
          } else {
            NotificationService().showNotifications(
                title: message.notification?.title,
                description: message.notification?.body,
                messageData: message.data);
          }
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('onMessageOpenedApp called');
        selectNotificationStream.add(jsonEncode(message.data));
      });
    }
  }
}
