import 'package:pak_mcqs/provider/authentication_provider.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:pak_mcqs/utils/string.dart';
import 'package:pak_mcqs/utils/style.dart';
import 'package:pak_mcqs/view/widgets/custom_button.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future logoutDialog({
  required BuildContext context,
}) {
  final authProvider = Provider.of<AuthProvider>(context, listen: false);
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: backgroundColor,
            insetPadding: const EdgeInsets.all(10),
            contentPadding: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Container(
              color: backgroundColor,
              width: 250.w,
              height: 130.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  "Are you sure you want to logout from app."
                      .toText(
                      maxLine: 2,
                      textAlign: TextAlign.center,
                      color: whitePrimary,
                      fontSize: 15,
                      fontFamily: sofiaLight)
                      .center,
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          height: 35.h,
                          width: 94.w,
                          buttonColor: Colors.transparent,
                          buttonTextColor: whitePrimary,
                          borderColor: yellowPrimary,
                          buttonName: btnCancel,
                          textSize: 14,
                          radius: 8,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      10.width,
                      CustomButton(
                          height: 35.h,
                          width: 94.w,
                          isGradient: false,
                          buttonColor: yellowPrimary,
                          buttonTextColor: whitePrimary,
                          borderColor: yellowPrimary,
                          textSize: 14,
                          buttonName: btnLogout,
                          radius: 8,
                          onPressed: () {authProvider.logoutUser(context);})
                    ],
                  )
                ],
              ).paddingSymmetric(vertical: 20.h, horizontal: 10),
            ));
      });
}
