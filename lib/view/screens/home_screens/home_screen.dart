import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pak_mcqs/provider/home_provider.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:pak_mcqs/utils/dimension.dart';
import 'package:pak_mcqs/view/screens/home_screens/power_play_screen_tab.dart';
import 'package:pak_mcqs/view/screens/home_screens/live_screen_tab.dart';
import 'package:pak_mcqs/view/screens/home_screens/history_screen_tab.dart';
import 'package:pak_mcqs/view/screens/home_screens/account_screen_tab.dart';
import 'package:pak_mcqs/view/screens/home_screens/upcoming_screen_tab.dart';
import 'package:pak_mcqs/view/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }


  final List _tabs = [
    const HistoryScreenTab(),
    const LiveScreenTab(),
    const PowerPlayScreenTab(),
    const UpcomingScreenTab(),
    const AccountScreenTab(),
  ];

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Consumer<HomeProvider>(builder: (context, controller, child) {
          return _tabs[controller.currentBNBIndex];
        }),
        bottomNavigationBar: BottomNavigateBar(),
      )
    );
  }
}
