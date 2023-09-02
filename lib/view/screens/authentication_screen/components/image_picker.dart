
import 'package:flutter/material.dart';
import 'package:pak_mcqs/provider/authentication_provider.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:pak_mcqs/utils/string.dart';
import 'package:pak_mcqs/utils/style.dart';
import 'package:pak_mcqs/view/widgets/custom_button.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';
import 'package:provider/provider.dart';

Future showImagePicker({
  required BuildContext context,
}) {
  final authProvider = Provider.of<AuthProvider>(context, listen: false);
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            insetPadding: const EdgeInsets.all(0),
            contentPadding: const EdgeInsets.all(0),
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
                  imageDescription.toText(
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
                          buttonColor: whitePrimary,
                          buttonTextColor: blackPrimary,
                          borderColor: greyPrimary,
                          buttonName: camera,
                          textSize: 14,
                          radius: 8,
                          onPressed: () {
                            Navigator.pop(context);
                            authProvider.camera(context);
                          }),
                      10.width,
                      CustomButton(
                          height: 35.h,
                          width: 94.w,
                          buttonColor: whitePrimary,
                          buttonTextColor: blackPrimary,
                          borderColor: greyPrimary,
                          textSize: 14,
                          buttonName: gallery,
                          radius: 8,
                          onPressed: () {
                            Navigator.pop(context);
                            authProvider.gallery(context);
                          }
                      )
                    ],
                  )
                ],
              ).paddingSymmetric(vertical: 20.h, horizontal: 10),
            ));
      });
}