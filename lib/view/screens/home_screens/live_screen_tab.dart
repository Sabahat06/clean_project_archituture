import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pak_mcqs/helper/routes_helper.dart';
import 'package:pak_mcqs/provider/authentication_provider.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:pak_mcqs/utils/dimension.dart';
import 'package:pak_mcqs/view/widgets/custom_drawer.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';

import 'package:provider/provider.dart';

import '../../widgets/show_loader.dart';

class LiveScreenTab extends StatefulWidget {
  const LiveScreenTab({Key? key}) : super(key: key);

  @override
  State<LiveScreenTab> createState() => _LiveScreenTabState();
}

class _LiveScreenTabState extends State<LiveScreenTab> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: backgroundColor,
        body: Container(
          height: 812.h,
          width: double.infinity,
          child: Consumer<AuthProvider>(builder: (context, controller, child) {
            return Container(
              height: 812.h,
              width: double.infinity,
              color: greenPrimary,
            );
          }),
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
