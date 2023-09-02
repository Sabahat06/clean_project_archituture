// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:pak_mcqs/helper/routes_helper.dart';
// import 'package:pak_mcqs/utils/app_keys.dart';
// import 'package:pak_mcqs/utils/colors.dart';
//
// class FirebaseMessagingHelper {
//   // static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   static void startMessageListener(context) async {
//
//     /// Flutter Local Notification Plugin
//     // var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
//     // var initializationSettingsIOS = const DarwinInitializationSettings();
//     //
//     // var initSettings = InitializationSettings(
//     //     android: initializationSettingsAndroid,
//     //     iOS: initializationSettingsIOS
//     // );
//     //
//     // var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//     //   'Notifications',
//     //   'Events Notifications',
//     //   // 'Notifies you about the events',
//     //   // Todo 'Notifies you about the events', commented due to error
//     //   icon: '@mipmap/ic_launcher',
//     //   largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
//     // );
//     // var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
//     // var platformChannelSpecifics = NotificationDetails(
//     //     android: androidPlatformChannelSpecifics,
//     //     iOS: iOSPlatformChannelSpecifics
//     // );
//     // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     //   String notificationTitle = message.notification!.title.toString();
//     //   String notificationBody = message.notification!.body.toString();
//     //   try {
//     //     final id = DateTime.now().millisecondsSinceEpoch ~/1000;
//     //
//     //     NotificationDetails notificationDetails = const NotificationDetails(
//     //         android: AndroidNotificationDetails(
//     //             "Engage",
//     //             "My channel",
//     //             importance: Importance.max,
//     //             priority: Priority.high,
//     //             icon: "@mipmap/ic_launcher"
//     //         ),
//     //         iOSPlatformChannelSpecifics: DarwinNotificationDetails()
//     //     );
//     //
//     //     await flutterLocalNotificationsPlugin.show(
//     //       id,
//     //       message.notification!.title,
//     //       message.notification!.body,
//     //       notificationDetails,
//     //       payload: '',
//     //     );
//     //   } on Exception catch (e) {
//     //     print(e);
//     //   }
//     // });
//
//     ///Awesome Notification Plugin
//     AwesomeNotifications().initialize(
//       null,
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic Notifications',
//           defaultColor: backgroundColor,
//           importance: NotificationImportance.High,
//           channelShowBadge: true,
//           channelDescription: 'Description'
//         ),
//       ],
//     );
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       String notificationTitle = message.notification!.title.toString();
//       String notificationBody = message.notification!.body.toString();
//       final id = DateTime.now().millisecondsSinceEpoch ~/1000;
//       try{
//         await AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: id,
//             channelKey: 'basic_channel',
//             title: notificationTitle,
//             body: notificationBody,
//           ),
//         );
//         // var initializationSettingsAndroid = const AndroidInitializationSettings('flutter_devs');
//         // var initializationSettingsIOs = const IOSInitializationSettings();
//         // var initSettings = InitializationSettings(
//         //     android: initializationSettingsAndroid,
//         //     iOS: initializationSettingsIOs
//         // );
//         // selectNotification(dynamic payload) async {
//         //   Navigator.pushNamed(AppKeys.mainNavigatorKey.currentState!.context, RouterHelper.loginScreen);
//         // }
//         // flutterLocalNotificationsPlugin.initialize(
//         //     initSettings,
//         //     onSelectNotification: selectNotification
//         // );
//       }
//       catch(e) {
//         print(e);
//       }
//     });
//
//     // AwesomeNotifications().actionStream.listen((receivedNotification) {
//     //   print("user tapped on notification " + receivedNotification.id.toString());
//     // });
//
//     /// Use this method to detect when a new notification or a schedule is created
//     @pragma("vm:entry-point")
//     Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
//       // Your code goes here
//     }
//
//     /// Use this method to detect every time that a new notification is displayed
//     @pragma("vm:entry-point")
//     Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
//       // Your code goes here
//     }
//
//     /// Use this method to detect if the user dismissed a notification
//     @pragma("vm:entry-point")
//     Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
//       // Your code goes here
//     }
//
//     /// Use this method to detect when the user taps on a notification or action button
//     @pragma("vm:entry-point")
//     Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
//       // Navigator.pushNamed(AppKeys.mainNavigatorKey.currentState!.context, RouterHelper.loginScreen);
//     }
//
//
//     AwesomeNotifications().setListeners(
//       onActionReceivedMethod: (ReceivedAction receivedAction) async {
//         onActionReceivedMethod(receivedAction);
//       },
//       onNotificationCreatedMethod: (ReceivedNotification receivedNotification) async {
//         onNotificationCreatedMethod(receivedNotification);
//       },
//       onNotificationDisplayedMethod: (ReceivedNotification receivedNotification) async {
//         onNotificationDisplayedMethod(receivedNotification);
//       },
//       onDismissActionReceivedMethod: (ReceivedAction receivedAction) async {
//         onDismissActionReceivedMethod(receivedAction);
//       },
//     );
//
//     // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//   }
//
//   // static Future<void> sendNotification(String title, String body) async {
//   //   /// Local Notification
//   //   var initializationSettingsAndroid = const AndroidInitializationSettings('flutter_devs');
//   //   var initializationSettingsIOs = const DarwinInitializationSettings();
//   //   var initSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOs);
//   //
//   //   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//   //     'Notifications',
//   //     'Events Notifications',
//   //     // 'Notifies you about the events',
//   //     // Todo commented 'Notifies you about the events', due to error
//   //     icon: 'flutter_devs',
//   //     largeIcon: DrawableResourceAndroidBitmap('flutter_devs'),
//   //   );
//   //   var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
//   //   var platformChannelSpecifics = NotificationDetails(
//   //       android: androidPlatformChannelSpecifics,
//   //       iOS: iOSPlatformChannelSpecifics
//   //   );
//   //   flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics);
//   //
//   // }
//
// }
// //
// // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   print('A background notification');
// // }
