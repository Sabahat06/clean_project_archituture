
import 'package:flutter/material.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';

import '../../utils/colors.dart';
import '../../utils/style.dart';
import 'extention/border_extension.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.buttonName,
      required this.onPressed,
      this.buttonTextColor = whitePrimary,
      this.buttonColor = yellowPrimary,
      this.borderColor = yellowPrimary,
      this.height,
      this.width,
      this.isGradient = true,
      this.radius = 30,

      this.textSize = 16});

  String buttonName;
  VoidCallback onPressed;
  Color buttonColor;
  Color borderColor;
  bool isGradient;
  Color buttonTextColor = whitePrimary;
  double? height;
  double? width;
  double radius;
  double textSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            height: height ?? 50.h,
            width: width ?? 343.w,
            decoration: BoxDecoration(
                borderRadius: borderRadiusCircular(radius),
                border: borderAll(color: borderColor),
                gradient: isGradient ? const LinearGradient(
                  begin: Alignment(
                    -0.5,
                    0,
                  ),
                  end: Alignment(
                    0.7,
                    0,
                  ),
                  colors: [
                    buttonColorPrimary,
                    buttonColorSecondary,
                  ],
                ) : null,
                color: buttonColor),
            child: buttonName
                .toText(
                    color: buttonTextColor,
                    fontSize: textSize,
                    fontFamily: sofiaRegular)
                .center));
  }


}
