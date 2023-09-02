
import 'package:flutter/material.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/style.dart';

class BlueGradient extends StatelessWidget {
  const BlueGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: 390.w,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
            gradientDarkGreen,
            gradientGreen,
            gradientLightSkyBLue,
            gradientSkyBlue
          ])),
    );
  }
}
