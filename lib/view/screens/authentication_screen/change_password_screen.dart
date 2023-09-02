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
import 'package:pak_mcqs/view/screens/authentication_screen/components/image_picker.dart';
import 'package:pak_mcqs/view/widgets/custom_button.dart';
import 'package:pak_mcqs/view/widgets/custom_text_field.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';
import 'package:pak_mcqs/view/widgets/shimmer_image.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

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
                      65.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Images.arrowBack, width: 15.w, height: 15.w,).onPress(() {
                            Navigator.pop(context);
                          }),
                          "Change Password".toText(color: blackPrimary, fontSize: 20, fontWeight: FontWeight.w500),
                          Container(),
                        ],
                      ),

                      30.height,
                      oldPassword.toText(color: blackPrimary, fontSize: 14),

                      10.height,
                      CustomTextField(
                        controller: controller.oldPasswordTextEditingController,
                        // height: 50.h,
                        fillColor: greyPrimary,
                        borderColor: greyPrimary,
                        hintText: password,
                        isVisible: controller.isOldPasswordVisible,
                        obscureText: controller.isOldPasswordVisible,
                        radius: 15,
                        isPassword: true,
                        iconColor: blackPrimary,
                        validator: (value) {
                          return Validation.passwordValidation(value);
                        },
                        onSuffixIconTap: () {
                          controller.oldPasswordVisibility();
                        },
                      ),
                      12.height,

                      newPassword.toText(color: blackPrimary, fontSize: 14),
                      10.height,
                      CustomTextField(
                        controller: controller.newPasswordTextEditingController,
                        // height: 50.h,
                        fillColor: greyPrimary,
                        borderColor: greyPrimary,
                        hintText: password,
                        isVisible: controller.isNewPasswordVisible,
                        obscureText: controller.isNewPasswordVisible,
                        radius: 15,
                        isPassword: true,
                        iconColor: blackPrimary,
                        validator: (value) {
                          return Validation.passwordValidation(value);
                        },
                        onSuffixIconTap: () {
                          controller.newPasswordVisibility();
                        },
                      ),
                      12.height,

                      confirmNewPassword.toText(color: blackPrimary, fontSize: 14),
                      10.height,
                      CustomTextField(
                        controller: controller.confirmNewPasswordTextEditingController,
                        // height: 50.h,
                        fillColor: greyPrimary,
                        borderColor: greyPrimary,
                        hintText: password,
                        isVisible: controller.isConfirmNewPasswordVisible,
                        obscureText: controller.isConfirmNewPasswordVisible,
                        radius: 15,
                        isPassword: true,
                        iconColor: blackPrimary,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Please enter confirm password.";
                          }
                          if(controller.newPasswordTextEditingController.text != value){
                            return "Passwords must match.";
                          }
                        },
                        onSuffixIconTap: () {
                          controller.newConfirmPasswordVisibility();
                        },
                      ),
                      30.height,

                      controller.isChangePasswordLoading ? const Center(child: CircularProgressIndicator(),) :  CustomButton(
                        buttonName: changePassword,
                        width: double.infinity,
                        height: 55.h,
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            controller.changePassword(context);
                          }
                        },
                        radius: 15,
                      ),

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
