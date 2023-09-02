import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pak_mcqs/data/db/shared-preferences.dart';
import 'package:pak_mcqs/helper/routes_helper.dart';
import 'package:pak_mcqs/helper/validation.dart';
import 'package:pak_mcqs/provider/authentication_provider.dart';
import 'package:pak_mcqs/utils/colors.dart';
import 'package:pak_mcqs/utils/dimension.dart';
import 'package:pak_mcqs/utils/images.dart';
import 'package:pak_mcqs/utils/string.dart';
import 'package:pak_mcqs/view/screens/authentication_screen/components/change_password_dialoge.dart';
import 'package:pak_mcqs/view/widgets/custom_button.dart';
import 'package:pak_mcqs/view/widgets/custom_text_field.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/string_extension.dart';
import 'package:pak_mcqs/view/widgets/extention/widget_extension.dart';
import 'package:pak_mcqs/view/widgets/show_toast.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../widgets/show_loader.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool fromRegistrationScreen = ModalRoute.of(context)!.settings.arguments as bool;
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
        backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Consumer<AuthProvider>(builder: (context, controller, child) {
                return Form(
                  key: otpFormKey,
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
                          otpVerification.toText(color: whitePrimary, fontWeight: FontWeight.w600, fontSize: 25),
                          10.width,
                        ],
                      ),

                      30.height,
                      "Please check ${controller.otpSendEmail} email to see the verification code 📨".toText(color: whitePrimary.withOpacity(0.7), fontSize: 16, overflow: TextOverflow.visible),

                      100.height,
                      otpCode.toText(color: whitePrimary, fontSize: 14),

                      10.height,

                      Pinput(
                        controller: controller.otpCodeTextEditingController,
                        length: 6,
                        defaultPinTheme: PinTheme(
                          height: 50.w,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: whitePrimary.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5)
                          )
                        ),
                        validator: (value) {
                          if(value!.length<6) {
                            return "Please enter valid otp.";
                          }
                        },
                        onCompleted: (value) async {
                          if(fromRegistrationScreen) {
                            controller.otpValue = value;
                            await controller.verifyOtp(context);
                            if(controller.showChangePassword) {
                              // LocalDb.storeUser(controller.authModel);
                              showToast(message: "You have successfully register into app.");
                              Navigator.pushNamedAndRemoveUntil(context, RouterHelper.homeScreen, (route) => false);
                              var data = await controller.getProfile(context);
                              String token = controller.authModel.user!.token!;
                              controller.authModel = data;
                              controller.authModel.user!.token = token;
                              LocalDb.storeUser(controller.authModel);
                              controller.updateFCMToken(context);
                            }

                          } else {
                            controller.otpValue = value;
                            print("otp value is ${controller.otpValue}");
                            await controller.verifyOtp(context);
                            if(controller.showChangePassword) changePasswordDialoge(context);
                          }
                        },
                      ),
                      40.height,

                      controller.isVerifyOtpLoading ? showLoader() : CustomButton(
                        buttonName: btnVerify,
                        onPressed: () async {
                          if(otpFormKey.currentState!.validate()) {
                            if(fromRegistrationScreen) {
                              // Navigator.pushNamedAndRemoveUntil(context, RouterHelper.homeScreen, (route) => false);
                              controller.otpValue = controller.otpCodeTextEditingController.text;
                              await controller.verifyOtp(context);
                              if(controller.showChangePassword) {
                                showToast(message: "You have successfully register into app.");
                                Navigator.pushNamedAndRemoveUntil(context, RouterHelper.homeScreen, (route) => false);
                                var data = await controller.getProfile(context);
                                String token = controller.authModel.user!.token!;
                                controller.authModel = data;
                                controller.authModel.user!.token = token;
                                LocalDb.storeUser(controller.authModel);
                                controller.updateFCMToken(context);
                              }
                            }
                            else {
                              controller.otpValue = controller.otpCodeTextEditingController.text;
                              print("otp value is ${controller.otpValue}");
                              await controller.verifyOtp(context);
                              if(controller.showChangePassword) changePasswordDialoge(context);
                            }
                          }
                        },
                        radius: 10,
                      ),

                      30.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          sendCodeReload.toText(color: whitePrimary.withOpacity(0.7), fontSize: 14),
                          controller.startTime == 0
                            ? controller.isSendOtpLoading ? showLoader(size: 18) : "Resend OTP".toString().toText(color: whitePrimary.withOpacity(0.7), fontSize: 14,).onPress(() async {
                              await controller.sendOtp(context, controller.otpSendEmail!, false, navigateToNextScreen: false);
                              controller.startTime = 60;
                              controller.startTimer();
                            })
                            : "00 : ${controller.startTime}".toString().toText(color: whitePrimary.withOpacity(0.7), fontSize: 14),
                        ],
                      ),

                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          wrongEmail.toText(color: whitePrimary.withOpacity(0.7), fontSize: 14),
                          changeEmail.toText(color: purpleColor.withOpacity(0.7), fontSize: 14).onPress(() {
                            Navigator.pop(context);
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
