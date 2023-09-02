import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pak_mcqs/helper/routes_helper.dart';
import 'package:pak_mcqs/helper/validation.dart';
import 'package:pak_mcqs/provider/authentication_provider.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:pak_mcqs/utils/dimension.dart';
import 'package:pak_mcqs/utils/images.dart';
import 'package:pak_mcqs/utils/string.dart';
import 'package:pak_mcqs/view/widgets/custom_button.dart';
import 'package:pak_mcqs/view/widgets/custom_text_field.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../widgets/show_loader.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Container(
            height: 812.h,
            width: double.infinity,
            child: Consumer<AuthProvider>(builder: (context, controller, child) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      55.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Images.arrowBack, width: 15.w, height: 15.w, color: whitePrimary,).onPress(() {
                            Navigator.pop(context);
                          }),
                          forgotPassword.toText(color: whitePrimary, fontWeight: FontWeight.w600, fontSize: 25),
                          10.width,
                        ],
                      ),

                      30.height,
                      forgotPasswordText.toText(color: whitePrimary.withOpacity(0.7), fontSize: 16, overflow: TextOverflow.visible, maxLine: 2),

                      100.height,
                      email.toText(color: whitePrimary, fontSize: 14),

                      10.height,
                      CustomTextField(
                        controller: controller.otpEmailTextEditingController,
                        // height: 50.h,
                        fillColor: textFieldColor,
                        borderColor: textFieldColor,
                        hintText: email,
                        radius: 5,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          return Validation.emailValidation(value);
                        },
                      ),
                      40.height,

                      controller.isSendOtpLoading ? showLoader() :  CustomButton(
                        buttonName: btnResetPassword,
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            controller.sendOtp(context, controller.otpEmailTextEditingController.text, false);
                          }
                        },
                        radius: 10,
                        height: 50.h,
                      ),

                    ],
                  ).paddingSymmetric(horizontal: 25.w),
                ),
              );
            }),
          )
      ),
    );
  }
}
