import 'package:flutter/material.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/style.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    required this.title,
    this.isBackEnable = true,
  });

  String title;
  bool isBackEnable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: 375.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isBackEnable == true
              ? Image.asset(
                  // Images.iconArrowBack,
                  '',
                  height: 20.w,
                  width: 20.w,
                  color: whitePrimary,
                ).onPress(() {
                  Navigator.pop(context);
                })
              : SizedBox(
                  width: 20.w,
                ),
          title
              .toText(
                  fontSize: 20,
                  fontFamily: sofiaSemiBold,
                  color: whitePrimary)
              .center,
          SizedBox(
            width: 20.w,
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
