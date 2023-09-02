import 'package:flutter/material.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

showLoader({double? size, Color? color}) {
  return Center(
    child: LoadingAnimationWidget.halfTriangleDot(
      color: color??yellowPrimary,
      size: size??30
    ),
  );
}