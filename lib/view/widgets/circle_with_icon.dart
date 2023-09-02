
import 'package:flutter/material.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';

import '../../utils/colors.dart';

class CircleWithIcon extends StatelessWidget {
  CircleWithIcon(
      {Key? key, this.icon, this.image, this.onTap, required this.isIcon})
      : super(key: key);
  IconData? icon;
  String? image;
  bool isIcon;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155.w,
      width: 155.w,
      decoration:
          const BoxDecoration(color: skyBlueLight, shape: BoxShape.circle),
      child: Container(
        decoration:
            const BoxDecoration(color: skyYellowPrimary, shape: BoxShape.circle),
        child: Container(
          decoration:
              const BoxDecoration(color: blueLight, shape: BoxShape.circle),
          child: isIcon == false
              ? Image.asset(
                  image!,
                  color: whitePrimary,
                  height: 25.w,
                  width: 25.w,
                ).align(Alignment.center)
              : Icon(
                  icon!,
                  color: whitePrimary,
                  size: 30.w,
                ).align(Alignment.center),
        ).paddingAll(30.w),
      ).paddingAll(25.w),
    ).onPress(onTap == null ? () {} : onTap!).center;
  }
}
