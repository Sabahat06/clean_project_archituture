import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pak_mcqs/provider/authentication_provider.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:pak_mcqs/utils/dimension.dart';
import 'package:pak_mcqs/view/widgets/custom_drawer.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';
import 'package:provider/provider.dart';

class HistoryScreenTab extends StatefulWidget {
  const HistoryScreenTab({Key? key}) : super(key: key);

  @override
  State<HistoryScreenTab> createState() => _HistoryScreenTabState();
}

class _HistoryScreenTabState extends State<HistoryScreenTab> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: backgroundColor,
        body: Consumer<AuthProvider>(builder: (context, controller, child) {
          return Container(
            height: 812.h,
            width: double.infinity,
            color: greenPrimary,
          );
        }),
        drawer: CustomDrawer(),
      ),
    );
  }

  Widget rowWithText(String title, String value, GestureTapCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title.toText(color: whitePrimary, fontSize: 16, fontWeight: FontWeight.w500),
        value.toText(color: yellowPrimary, fontSize: 16, isUnderLine: true),
      ],
    ).onPress(onTap);
  }

}
