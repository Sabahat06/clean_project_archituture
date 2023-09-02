import 'package:flutter/material.dart';
import 'package:pak_mcqs/utils/string.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../../../helper/validation.dart';
import '../../../../provider/authentication_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/show_loader.dart';

GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

Future<void> changePasswordDialoge(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<AuthProvider>(builder: (context, controller, child)  {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Container(
            // height: 380.h,
            width: 345.w,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: yellowPrimary, width: 1),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Form(
              key: changePasswordFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  5.height,
                  createPassword.toText(color: whitePrimary, fontWeight: FontWeight.w600, fontSize: 20),

                  10.height,
                  changePasswordText.toText(color: whitePrimary.withOpacity(0.7), fontSize: 16, overflow: TextOverflow.visible,),

                  20.height,
                  password.toText(color: whitePrimary, fontSize: 14),
                  10.height,
                  CustomTextField(
                    controller: controller.passwordChangeTextEditingController,
                    // height: 60.h,
                    fillColor: textFieldColor,
                    borderColor: textFieldColor,
                    hintText: password,
                    isVisible: controller.isForgotPasswordVisible,
                    obscureText: controller.isForgotPasswordVisible,
                    radius: 5,
                    isPassword: true,
                    iconColor: greyTextColor,
                    validator: (value) {
                      return Validation.passwordValidation(value);
                    },
                    onSuffixIconTap: () {
                      controller.forgotPasswordVisibility();
                    },
                  ),

                  20.height,
                  confirmPassword.toText(color: whitePrimary, fontSize: 14),
                  10.height,
                  CustomTextField(
                    controller: controller.confirmPasswordChangeTextEditingController,
                    // height: 60.h,
                    fillColor: textFieldColor,
                    borderColor: textFieldColor,
                    hintText: confirmPassword,
                    isVisible: controller.isConfirmForgotPasswordVisible,
                    obscureText: controller.isConfirmForgotPasswordVisible,
                    radius: 10,
                    isPassword: true,
                    iconColor: greyTextColor,
                    onSuffixIconTap: () {
                      controller.confirmForgotPasswordVisibility();
                    },
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please enter confirm password.";
                      }
                      if(controller.confirmPasswordChangeTextEditingController.text != controller.passwordChangeTextEditingController.text){
                        return "Passwords must match.";
                      }
                    },
                  ),
                  20.height,

                  controller.isForgotPasswordLoading ? showLoader() :  CustomButton(
                    buttonName: btnSave,
                    height: 45.h,
                    radius: 10,
                    onPressed: () {
                      if(changePasswordFormKey.currentState!.validate()) {
                        controller.forgotPassword(context);
                      }
                    }),
                ],
              ).paddingSymmetric(horizontal: 20.w, vertical: 25.h),
            ),

          ),
        );
      });

    },
  );
}
