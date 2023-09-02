
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pak_mcqs/helper/firebase_messaging_helper.dart';
import 'package:pak_mcqs/utils/app_keys.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:provider/provider.dart';
import 'helper/provider_helper.dart';
import 'helper/routes_helper.dart';
import 'helper/scroll_behaviour.dart';

// Future<void> backgroundHandler(RemoteMessage message) async{
//   // currentOrder = await HttpService.getOrderWithID(message.data['order_id']);
//   // print(message.data.toString());
//   print(message.notification!.title);
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    // AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    //   if (!isAllowed) {
    //     AwesomeNotifications().requestPermissionToSendNotifications();
    //   }
    // });
    // FirebaseMessagingHelper.startMessageListener(context);
    // ///gives you the message on which user taps
    // ///and it opened the app from terminated state
    // ///
    // FirebaseMessaging.instance.getInitialMessage().then((message) async {
    //   print("Notification message is ${message}");
    //   if(message!=null) {
    //     // Navigator.pushNamed(context, RouterHelper.loginScreen);
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderHelper.providers,
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            ),
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Game App',
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          primaryColor: yellowPrimary
        ),

        navigatorKey: AppKeys.mainNavigatorKey,
        initialRoute: RouterHelper.initial,
        routes: RouterHelper.routes
      ),
    );
  }
}