import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pak_mcqs/data/model/auth_model/auth_model.dart';
import 'package:pak_mcqs/view/widgets/custom_button.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';
import 'package:provider/provider.dart';
import '../../../data/db/shared-preferences.dart';
import '../../../helper/routes_helper.dart';
import '../../../provider/authentication_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimension.dart';
import '../../../utils/images.dart';
import '../../../utils/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    routes();
  }

  void routes() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    var user = await LocalDb.getUser();
    Timer(const Duration(seconds: 2), () {
      // if(user!=null) {
      //   authProvider.authModel = AuthModel.fromJson(user);
      //   Navigator.pushNamedAndRemoveUntil(context, RouterHelper.homeScreen, (route) => false);
      // }
      // else {
      //   Navigator.of(context).pushReplacementNamed(
      //     RouterHelper.firstIntroScreen,
      //   );
      // }
      Navigator.of(context).pushReplacementNamed(
        RouterHelper.loginScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Consumer<AuthProvider>(builder: (context, controller, child) {
          return Container(
            height: 812.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.logoImage,
                  height: 100.h,
                  width: 200.w,
                  fit: BoxFit.cover,
                ).center,
              ],
            ),
          );
        }
      ),
    ));
  }
}
