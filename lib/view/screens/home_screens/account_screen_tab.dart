import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pak_mcqs/helper/routes_helper.dart';
import 'package:pak_mcqs/provider/authentication_provider.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:pak_mcqs/utils/dimension.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_drawer.dart';

class AccountScreenTab extends StatefulWidget {
  const AccountScreenTab({Key? key}) : super(key: key);

  @override
  State<AccountScreenTab> createState() => _AccountScreenTabState();
}

class _AccountScreenTabState extends State<AccountScreenTab> {
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
        body: SingleChildScrollView(
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
