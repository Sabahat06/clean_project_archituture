import 'package:flutter/material.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/style.dart';
import 'extention/border_extension.dart';

class ButtonWithIcon extends StatelessWidget {
  ButtonWithIcon(
      {required this.buttonName,
      required this.onPressed,
      this.buttonTextColor = whitePrimary,
      this.buttonColor = yellowPrimary,
      this.borderColor = yellowPrimary,
      this.height,
      this.width,
      required this.icon});

  String buttonName;
  VoidCallback onPressed;
  Color buttonColor;
  Color borderColor;
  Color buttonTextColor = whitePrimary;
  double? height;
  double? width;
  String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            height: height ?? 44.h,
            width: width ?? 322.w,
            decoration: BoxDecoration(
                borderRadius: borderRadiusCircular(30),
                border: borderAll(color: borderColor),
                color: buttonColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  height: 25.w,
                  width: 25.w,
                ),
                20.width,
                buttonName
                    .toText(
                        color: buttonTextColor,
                        fontSize: 16,
                        fontFamily: sofiaRegular)
                    .center
              ],
            )));
  }
}
