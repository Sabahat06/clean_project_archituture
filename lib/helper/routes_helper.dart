import 'package:flutter/material.dart';
import 'package:pak_mcqs/view/screens/splash_screen/splash_screen.dart';
import '../view/screens/authentication_screen/change_password_screen.dart';
import '../view/screens/authentication_screen/forgot_password.dart';
import '../view/screens/authentication_screen/login_screen.dart';
import '../view/screens/authentication_screen/otp_verification.dart';
import '../view/screens/authentication_screen/profile_setting_screen.dart';
import '../view/screens/authentication_screen/registration_screen.dart';

class RouterHelper {
  static const initial = "/";
  static const firstIntroScreen = "/firstIntroScreen";
  static const secondIntroScreen = "/secondIntroScreen";
  static const thirdIntroScreen = "/thirdIntroScreen";
  static const selectedScreen = "/selectedScreen";

  ///Authentication Screen

  static const changePasswordScreen = "/changePasswordScreen";
  static const profileSettingScreen = "/profileSettingScreen";
  static const forgotPasswordScreen = "/forgotPasswordScreen";
  static const loginScreen = "/loginScreen";
  static const otpVerificationScreen = "/otpVerificationScreen";
  static const registrationScreen = "/registrationScreen";
  static const noConnectionScreen = "/noConnectionScreen";
  static const homeScreen = "/homeScreen";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => const SplashScreen(),
    registrationScreen: (context) => const RegistrationScreen(),
    changePasswordScreen: (context) => const ChangePasswordScreen(),
    profileSettingScreen: (context) => const ProfileSettingScreen(),
    forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
    loginScreen: (context) => const LoginScreen(),
    otpVerificationScreen: (context) => const OtpVerificationScreen(),
  };
}
