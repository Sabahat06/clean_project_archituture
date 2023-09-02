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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
          body: SingleChildScrollView(
            child: Container(
              height: 812.h,
              width: double.infinity,
              child: Consumer<AuthProvider>(builder: (context, controller, child) {
                return Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      100.height,
                      welcomeBack.toText(color: whitePrimary, fontWeight: FontWeight.w600, fontSize: 28, maxLine: 2),

                      10.height,
                      enterEmailAndPassword.toText(color: whiteLight.withOpacity(0.7), fontSize: 16, maxLine: 2),

                      75.height,
                      email.toText(color: whitePrimary, fontSize: 14),

                      8.height,
                      CustomTextField(
                        controller: controller.emailSignInTextEditingController,
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
                      25.height,

                      password.toText(color: whitePrimary, fontSize: 14),
                      8.height,
                      CustomTextField(
                        controller: controller.passwordSignInTextEditingController,
                        // height: 50.h,
                        fillColor: textFieldColor,
                        borderColor: textFieldColor,
                        hintText: password,
                        isVisible: controller.isVisible,
                        obscureText: controller.isVisible,
                        radius: 5,
                        isPassword: true,
                        iconColor: greyTextColor,
                        validator: (value) {
                          return Validation.passwordValidation(value);
                        },
                        onSuffixIconTap: () {
                          controller.passwordVisibility();
                        },
                      ),
                      25.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 17.h,
                                width: 17.h,
                                decoration: BoxDecoration(
                                  color: controller.isRemember ? yellowPrimary : whitePrimary,
                                  border: Border.all(color: yellowPrimary, width: 1)
                                ),
                                child: Center(
                                  child: Icon(Icons.done, size: 15.h, color: whitePrimary,),
                                ),
                              ),
                              7.width,
                              rememberMe.toText(color: whitePrimary, fontSize: 14),
                            ],
                          ).onPress(() {
                            controller.rememberMe();
                          }),
                          forgotPassword.toText(color: purpleColor, fontSize: 14).onPress(() {
                            Navigator.pushNamed(context, RouterHelper.forgotPasswordScreen);
                          }),
                        ],
                      ),

                      25.height,

                      controller.isSignInLoading ? showLoader() : CustomButton(
                        buttonName: btnSignIn,
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            // controller.signInUser(context);
                            Navigator.pushNamedAndRemoveUntil(context, RouterHelper.homeScreen, (route) => false);
                          }
                        },
                        height: 50.h,
                        radius: 10,
                      ),

                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          dontHaveAnAccountYetRegister.toText(color: greyTextColor, fontSize: 14),
                          register.toText(color: purpleColor, fontSize: 14).onPress(() {
                            Navigator.pushNamed(context, RouterHelper.registrationScreen);
                          }),
                        ],
                      ),
                      30.height,


                    ],
                  ).paddingSymmetric(horizontal: 30.w),
                );
              }),
            ),
          )
      ),
    );
  }
}
