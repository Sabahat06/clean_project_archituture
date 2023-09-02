import 'package:flutter/material.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:pak_mcqs/view/widgets/custom_button.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';

import '../../helper/routes_helper.dart';
import '../../utils/images.dart';
import '../../utils/string.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            65.height,
            drawerWidget(
              "Current Matchups",
              Images.currentMatchers ,
              () {
                // Navigator.pop(context);Navigator.pushNamed(context, RouterHelper.currentMatchUpScreen, arguments: false);
                },
              true
            ),
            15.height,
            drawerWidget(
              "Packs Bought",
              Images.packBought,
              () {
                // Navigator.pop(context);Navigator.pushNamed(context, RouterHelper.packBoughtScreen);
              },
              true
            ),
            15.height,
            drawerWidget(
              "Unopened Packs",
              Images.unopenedPack,
              () {
                // Navigator.pop(context);Navigator.pushNamed(context, RouterHelper.unopenedPackScreen);
              },
              true
            ),
            15.height,
            drawerWidget(
              "Wallet",
              Images.wallet,
              () {
                // Navigator.pop(context);Navigator.pushNamed(context, RouterHelper.walletScreen);
              },
              true
            ),
            15.height,
            drawerWidget(
              "Points Tracker",
              Images.pointTracker,
              () {
                // Navigator.pop(context);Navigator.pushNamed(context, RouterHelper.pointTrackerScreen);
              },
              true
            ),
            30.height,


            const Divider(color: yellowPrimary,),

            10.height,
            drawerWidget("Privacy Policy", "", () {}, false),
            5.height,
            drawerWidget("Terms & Conditions", "", () {}, false),
            5.height,
            drawerWidget("About us", "", () {}, false),
            15.height,
            CustomButton(
              buttonName: btnLogout,
              height: 40.h,
              radius: 5,
              onPressed: () {}
            ).paddingSymmetric(horizontal: 45.w),
          ],
        ),
      ),
    );
  }

  drawerWidget(String title, String image, GestureTapCallback onTap, bool changeColor) {
    return  Container(
      color: !changeColor ? Colors.transparent : textFieldColor,
      child: image == ""
        ? ListTile(
          title: Container(width: 100.w, child: title.toText(color: whitePrimary, fontSize: 18)),
          onTap: onTap,
        ).paddingSymmetric(horizontal: 5.w)
        : ListTile(
          leading: Image.asset(image, width: 20.w, height: 20.w, fit: BoxFit.cover,),
          // leading: Container(),
          title: Container(width: 100.w, child: title.toText(color: whitePrimary, fontSize: 18)),
          onTap: onTap,
        ).paddingSymmetric(horizontal: 5.w),
    );
  }

}