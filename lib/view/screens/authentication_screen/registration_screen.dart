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

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

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
            height: MediaQuery.of(context).size.height,
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
                          createYourAccount.toText(color: whitePrimary, fontWeight: FontWeight.w600, fontSize: 25),
                          10.width,
                        ],
                      ),

                      30.height,
                      userName.toText(color: whitePrimary, fontSize: 14),

                      8.height,
                      CustomTextField(
                        controller: controller.userNameSignUpTextEditingController,
                        // height: 50.h,
                        fillColor: textFieldColor,
                        borderColor: textFieldColor,
                        hintText: hintUserName,
                        radius: 10,
                        validator: (value) {
                          return Validation.nameValidation(value);
                        },
                      ),
                      15.height,

                      email.toText(color: whitePrimary, fontSize: 14),
                      8.height,
                      CustomTextField(
                        controller: controller.emailSignUpTextEditingController,
                        // height: 50.h,
                        fillColor: textFieldColor,
                        borderColor: textFieldColor,
                        hintText: email,
                        radius: 10,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          return Validation.emailValidation(value);
                        },
                      ),
                      15.height,

                      phoneNumber.toText(color: whitePrimary, fontSize: 14),
                      8.height,
                      CustomTextField(
                        controller: controller.phoneSignUpTextEditingController,
                        // height: 50.h,
                        fillColor: textFieldColor,
                        borderColor: textFieldColor,
                        hintText: phoneNumber,
                        radius: 10,
                        textInputType: TextInputType.number,
                        validator: (value) {
                          return Validation.phoneValidation(value);
                        },
                      ),
                      15.height,

                      password.toText(color: whitePrimary, fontSize: 14),
                      8.height,
                      CustomTextField(
                        controller: controller.passwordSignUpTextEditingController,
                        // height: 50.h,
                        fillColor: textFieldColor,
                        borderColor: textFieldColor,
                        hintText: password,
                        isVisible: controller.isVisible,
                        obscureText: controller.isVisible,
                        radius: 10,
                        isPassword: true,
                        iconColor: greyTextColor,
                        onSuffixIconTap: () {
                          controller.passwordVisibility();
                        },
                        validator: (value) {
                          return Validation.passwordValidation(value);
                        },
                      ),
                      15.height,

                      confirmPassword.toText(color: whitePrimary, fontSize: 14),
                      8.height,
                      CustomTextField(
                        controller: controller.confirmPasswordSignUpTextEditingController,
                        // height: 50.h,
                        fillColor: textFieldColor,
                        borderColor: textFieldColor,
                        hintText: password,
                        isVisible: controller.isConfirmPasswordSignUpVisible,
                        obscureText: controller.isConfirmPasswordSignUpVisible,
                        radius: 10,
                        isPassword: true,
                        iconColor: greyTextColor,
                        onSuffixIconTap: () {
                          controller.confirmPasswordVisibility();
                        },
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Please enter confirm password.";
                          }
                          if(controller.confirmPasswordSignUpTextEditingController.text != controller.passwordSignUpTextEditingController.text){
                            return "Passwords must match.";
                          }
                        },
                      ),
                      15.height,

                      blockchainAddress.toText(color: whitePrimary, fontSize: 14),
                      8.height,
                      CustomTextField(
                        controller: controller.blockchainAddressTextEditingController,
                        // height: 50.h,
                        fillColor: textFieldColor,
                        borderColor: textFieldColor,
                        hintText: hintBlockchainAddress,
                        radius: 10,
                        // validator: (value) {
                        //   return Validation.blockChainAddressValidation(value);
                        // },
                      ),
                      18.height,

                      const Text.rich(

                        TextSpan(
                          children: [
                            TextSpan(text: "By Singing up, you’re agree to our ", style: TextStyle(color: whitePrimary, fontSize: 14,height: 1.5),),
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(color: purpleColor, fontSize: 14,height: 1.5),
                            ),
                            TextSpan(text: ' and ', style: TextStyle(color: whitePrimary, fontSize: 14,height: 1.5),),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(color: purpleColor, fontSize: 14,height: 1.5),
                            ),
                          ],
                        ),
                      ),

                      15.height,

                      controller.isRegisterLoading ? showLoader() :  CustomButton(
                        buttonName: btnSignUp,
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            controller.registerUser(context);
                          }
                        },
                        radius: 10,
                      ),

                      10.height,


                    ],
                  ).paddingSymmetric(horizontal: 30.w),
                ),
              );
            }),
          )
      ),
    );
  }
}
