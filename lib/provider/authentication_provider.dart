import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pak_mcqs/data/model/auth_model/auth_model.dart';
import 'package:pak_mcqs/data/repository/api_repo.dart';
import 'package:pak_mcqs/provider/home_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../data/db/shared-preferences.dart';
import '../helper/routes_helper.dart';
import '../utils/api_url.dart';
import '../view/widgets/show_toast.dart';

class AuthProvider extends ChangeNotifier {

  TextEditingController userNameSignUpTextEditingController = TextEditingController();
  TextEditingController blockchainAddressTextEditingController = TextEditingController();
  TextEditingController emailSignUpTextEditingController = TextEditingController();
  TextEditingController phoneSignUpTextEditingController = TextEditingController();
  TextEditingController passwordSignUpTextEditingController = TextEditingController();
  TextEditingController confirmPasswordSignUpTextEditingController = TextEditingController();
  TextEditingController userTypeSignUpTextEditingController = TextEditingController();

  ///Sign In Text Editing Controller
  TextEditingController emailSignInTextEditingController = TextEditingController();
  TextEditingController passwordSignInTextEditingController = TextEditingController();

  TextEditingController otpEmailTextEditingController = TextEditingController();


  ///Otp Verfication

  TextEditingController otpCodeTextEditingController = TextEditingController();

  ///Change Password
  TextEditingController passwordChangeTextEditingController = TextEditingController();
  TextEditingController confirmPasswordChangeTextEditingController = TextEditingController();

  ///Edit profile
  TextEditingController editNameTextEditingController = TextEditingController();
  TextEditingController editBlockchainTextEditingController = TextEditingController();
  TextEditingController editEmailTextEditingController = TextEditingController();
  TextEditingController editPhoneTextEditingController = TextEditingController();

  ///Change Password TextEditingController
  TextEditingController newPasswordTextEditingController = TextEditingController();
  TextEditingController oldPasswordTextEditingController = TextEditingController();
  TextEditingController confirmNewPasswordTextEditingController = TextEditingController();

  bool isVisible = false;
  bool isConfirmPasswordSignUpVisible = false;
  bool isConfirmPasswordVisible = false;

  ///Forgot Password Visibility
  bool isForgotPasswordVisible = false;
  bool isConfirmForgotPasswordVisible = false;

  ///Change password visibility

  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmNewPasswordVisible = false;

  ApiRepo apiRepo = ApiRepo();
  AuthModel authModel = AuthModel();
  AuthModel updatedAuthModel = AuthModel();

  String? otpSendEmail;
  String? otpValue;

  bool showChangePassword = false;

  File? profileImage;
//=====================================  Password Visibilities  ============================================

  ///Password visibilities
  passwordVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  confirmPasswordVisibility() {
    isConfirmPasswordSignUpVisible = !isConfirmPasswordSignUpVisible;
    notifyListeners();
  }

  oldPasswordVisibility() {
    isOldPasswordVisible = !isOldPasswordVisible;
    notifyListeners();
  }

  newPasswordVisibility() {
    isNewPasswordVisible = !isNewPasswordVisible;
    notifyListeners();
  }

  newConfirmPasswordVisibility() {
    isConfirmNewPasswordVisible = !isConfirmNewPasswordVisible;
    notifyListeners();
  }

  forgotPasswordVisibility() {
    isForgotPasswordVisible = !isForgotPasswordVisible;
    notifyListeners();
  }

  confirmForgotPasswordVisibility() {
    isConfirmForgotPasswordVisible = !isConfirmForgotPasswordVisible;
    notifyListeners();
  }

  bool isRemember = false;
  //======================================== Remember Me ======================================

  rememberMe() {
    isRemember = !isRemember;
    notifyListeners();
  }

  //======================================== OTP Code Resending Timer ======================================

  Timer? timer;
  int startTime = 60;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(startTime == 0) {
        timer.cancel();
        notifyListeners();
      }else {
        startTime = startTime - 1;
        notifyListeners();
      }
    });
  }

  //================================= Getting Device id ===============================================

  String deviceId = '';
  //Get device id
  getDeviceID() async {

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor!;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    }
  }


  //================================= Authentication APIs ===============================================

  // Register User API
  bool isRegisterLoading = false;
  registerUser(BuildContext context) async {
    FocusManager.instance.primaryFocus!.unfocus();
    isRegisterLoading = true;
    notifyListeners();
    await getDeviceID();
    try{

      dynamic data = {
        'name' : userNameSignUpTextEditingController.text,
        'email' : emailSignUpTextEditingController.text,
        'password' : passwordSignUpTextEditingController.text,
        'phone' : phoneSignUpTextEditingController.text,
        'blockchain_address' : blockchainAddressTextEditingController.text,
      };

      Response response = await apiRepo.postRequest(context, RouterHelper.noConnectionScreen, ApiUrl.signUpUser, data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Response is ${response.data}");
        notifyListeners();
        if(response.data['status'] == true) {
          authModel = AuthModel.fromJson(response.data);
          // showToast(message: response.data['message']);
          await sendOtp(context, emailSignUpTextEditingController.text, true);
          isRegisterLoading = false;
          userNameSignUpTextEditingController.clear();
          emailSignUpTextEditingController.clear();
          passwordSignUpTextEditingController.clear();
          confirmPasswordSignUpTextEditingController.clear();
          phoneSignUpTextEditingController.clear();
          otpCodeTextEditingController.clear();
          blockchainAddressTextEditingController.clear();
          // Navigator.pushNamed(context, RouterHelper.otpVerificationScreen, arguments: true);
        }
        else {
          showToast(message: response.data['message']);
        }
        notifyListeners();
      }
    } catch(e) {

      isRegisterLoading = false;
      notifyListeners();
      print(e);
    }

  }

  // Sign in User API
  bool isSignInLoading = false;
  signInUser(BuildContext context) async {
    FocusManager.instance.primaryFocus!.unfocus();
    // final introScreenProvider = Provider.of<IntroScreenProvider>(context, listen: false);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    isSignInLoading = true;
    notifyListeners();
    await getDeviceID();
    try{

      dynamic data = {
        'email' : emailSignInTextEditingController.text,
        'password' : passwordSignInTextEditingController.text,
      };

      Response response = await apiRepo.postRequest(context, RouterHelper.noConnectionScreen, ApiUrl.logInUrl, data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Response is ${response.data}");
        if(response.data['status'] == true) {
          authModel = AuthModel.fromJson(response.data);
          LocalDb.storeUser(authModel);
          showToast(message: "You have successfully logged into Engage.");
          // if(introScreenProvider.selectedSport.length != 0) {
          //   introScreenProvider.updatePreference(context);
          // }
          emailSignInTextEditingController.clear();
          passwordSignInTextEditingController.clear();
          homeProvider.currentBNBIndex = 2;
          Navigator.pushNamedAndRemoveUntil(context, RouterHelper.homeScreen, (route) => false);
          updateFCMToken(context);
        }
        else {
          showToast(message: response.data['message']);
        }
        isSignInLoading = false;
        notifyListeners();
      }
    } catch(e) {

      isSignInLoading = false;
      notifyListeners();
      print(e);
    }

  }

  // Update User API
  bool isUpdateUserLoading = false;
  updateUser(BuildContext context) async {
    FocusManager.instance.primaryFocus!.unfocus();
    isUpdateUserLoading = true;
    notifyListeners();
    try{

      dynamic data = {
        'email' : editEmailTextEditingController.text,
        'phone' : editPhoneTextEditingController.text,
        'name' : editNameTextEditingController.text,
        if(profileImage!=null) 'profile_photo' : await MultipartFile.fromFile(profileImage!.path),
        'blockchain_address' : editBlockchainTextEditingController.text
      };

      Response response = await apiRepo.multipartRequest(context, RouterHelper.noConnectionScreen, ApiUrl.profileUpdateUrl, data, bearerToken: authModel.user!.token);
      notifyListeners();
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Response is ${response.data}");
        notifyListeners();
        if(response.data['status'] == true) {
          var data = await getProfile(context);
          String token = authModel.user!.token!;
          authModel = data;
          authModel.user!.token = token;
          LocalDb.storeUser(authModel);
          showToast(message: "Your profile has been updated successfully");
          isUpdateUserLoading = false;
          Navigator.pushNamedAndRemoveUntil(context, RouterHelper.homeScreen, (route) => false);
        }
        else {
          isUpdateUserLoading = false;
          showToast(message: response.data['message']);
        }
        notifyListeners();
      }
    } catch(e) {
      isUpdateUserLoading = false;
      notifyListeners();
      print(e);
    }

  }

  // Get profile
  getProfile(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try{
      dynamic data = {
        '' : ''
      };

      Response response = await apiRepo.getRequest(context, RouterHelper.noConnectionScreen, ApiUrl.getProfile, data, bearerToken: authProvider.authModel.user!.token!);
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Response is ${response.data}");
        if(response.data['status'] == true) {
          var auth = AuthModel.fromJson(response.data);
          return auth;
        }
        notifyListeners();
      }
    } catch(e) {
      notifyListeners();
      print(e);
    }
  }

  // Send otp API
  bool isSendOtpLoading = false;
  sendOtp(BuildContext context, String email, bool isRegistration, {bool navigateToNextScreen = true}) async {
    otpSendEmail = email;

    FocusManager.instance.primaryFocus!.unfocus();
    isSendOtpLoading = true;
    notifyListeners();
    try{

      dynamic data = {
        'email' : email,
      };

      Response response = await apiRepo.postRequest(context, RouterHelper.noConnectionScreen, ApiUrl.otpSendUrl, data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Response is ${response.data}");
        if(response.data['status'] == true) {
          otpSendEmail = email;
          showToast(message: "OTP send to ${email}");
          otpEmailTextEditingController.clear();
          otpCodeTextEditingController.clear();
          if(navigateToNextScreen) {
            Navigator.pushNamed(context, RouterHelper.otpVerificationScreen, arguments: isRegistration ? true : false);
          }
        }
        else {
          showToast(message: response.data['message']);
        }
        isSendOtpLoading = false;
        notifyListeners();
      }
    } catch(e) {

      isSendOtpLoading = false;
      notifyListeners();
      print(e);
    }

  }

  // Verify otp API
  bool isVerifyOtpLoading = false;
  verifyOtp(BuildContext context) async {
    // final introScreenProvider = Provider.of<IntroScreenProvider>(context, listen: false);
    FocusManager.instance.primaryFocus!.unfocus();
    isVerifyOtpLoading = true;
    notifyListeners();
    try{

      dynamic data = {
        'email' : otpSendEmail,
        'otp' : otpValue,
      };

      Response response = await apiRepo.postRequest(context, RouterHelper.noConnectionScreen, ApiUrl.otpVerifyUrl, data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Response is ${response.data}");
        if(response.data['status'] == true) {
          showChangePassword = true;
          otpCodeTextEditingController.clear();
        }
        else {
          showChangePassword = false;
          showToast(message: response.data['message']);
        }
        isVerifyOtpLoading = false;
        notifyListeners();
      }
    } catch(e) {
      showChangePassword = false;
      isVerifyOtpLoading = false;
      notifyListeners();
      print(e);
    }

  }

  // Forgot password API
  bool isForgotPasswordLoading = false;
  forgotPassword(BuildContext context) async {
    FocusManager.instance.primaryFocus!.unfocus();
    isForgotPasswordLoading = true;
    notifyListeners();
    try{
      dynamic data = {
        'email' : otpSendEmail,
        'password' : passwordChangeTextEditingController.text,
      };

      Response response = await apiRepo.postRequest(context, RouterHelper.noConnectionScreen, ApiUrl.passwordForgotUrl, data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Response is ${response.data}");
        if(response.data['status'] == true) {
          showToast(message: "Your password has been change successfully.");
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(context, RouterHelper.loginScreen, (route) => false);
          passwordChangeTextEditingController.clear();
          confirmPasswordChangeTextEditingController.clear();
        }
        else {
          showToast(message: response.data['message']);
        }
        isForgotPasswordLoading = false;
        notifyListeners();
      }
    } catch(e) {
      isForgotPasswordLoading = false;
      notifyListeners();
      print(e);
    }

  }

  // Forgot password API
  bool isChangePasswordLoading = false;
  changePassword(BuildContext context) async {
    FocusManager.instance.primaryFocus!.unfocus();
    isChangePasswordLoading = true;
    notifyListeners();
    try{

      dynamic data = {
        'password' : newPasswordTextEditingController.text,
        'password_confirmation' : confirmNewPasswordTextEditingController.text,
      };

      Response response = await apiRepo.postRequest(context, RouterHelper.noConnectionScreen, ApiUrl.changePasswordUrl, data, bearerToken: authModel.user!.token);
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Response is ${response.data}");
        if(response.data['status'] == true) {
          showToast(message: "Your password has been change successfully.");
          Navigator.pop(context);
          oldPasswordTextEditingController.clear();
          newPasswordTextEditingController.clear();
          confirmNewPasswordTextEditingController.clear();
        }
        else {
          showToast(message: response.data['message']);
        }
        isChangePasswordLoading = false;
        notifyListeners();
      }
    } catch(e) {
      isChangePasswordLoading = false;
      notifyListeners();
      print(e);
    }

  }

  // Log out User API
  bool isLogoutLoading = false;
  logoutUser(BuildContext context) async {
    LocalDb.clearSharedPreferenceValue();
    showToast(message: "You have successfully logged out from Engage.");
    Navigator.pushNamedAndRemoveUntil(context, RouterHelper.loginScreen, (route) => false);
    // FocusManager.instance.primaryFocus!.unfocus();
    // isLogoutLoading = true;
    // notifyListeners();
    // try{
    //
    //   dynamic data = {
    //     '' : '',
    //   };
    //
    //   Response response = await apiRepo.postRequest(context, RouterHelper.noConnectionScreen, ApiUrl.logOutUrl, data, bearerToken: authModel.user!.token);
    //   if(response.statusCode == 200 || response.statusCode == 201) {
    //     debugPrint("Response is ${response.data}");
    //     if(response.data['status'] == true) {
    //       LocalDb.clearSharedPreferenceValue();
    //       showToast(message: "You have successfully logged out from nephcare.");
    //       // Navigator.pushNamedAndRemoveUntil(context, RouterHelper.loginScreen, (route) => false);
    //     }
    //     else {
    //       showToast(message: response.data['message']);
    //     }
    //     isLogoutLoading = false;
    //     notifyListeners();
    //   }
    // } catch(e) {
    //
    //   isLogoutLoading = false;
    //   notifyListeners();
    //   print(e);
    // }

  }

  //Update FCM Token
  updateFCMToken(BuildContext context) async {
    // String? fcmToken = await FirebaseRepo.getFcmToken(context, 'screen');
    try{
      dynamic data = {
        'firebase_token' : deviceId
      };

      Response response = await apiRepo.postRequest(context, RouterHelper.noConnectionScreen, ApiUrl.updateFCMToken, data, bearerToken: authModel.user!.token!);
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("Response is ${response.data}");
        if(response.data['status'] == true) {

        }
        notifyListeners();
      }
    } catch(e) {
      notifyListeners();
      print(e);
    }
  }

  //open camera
  camera(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.camera, imageQuality: 25);

    profileImage = File(image!.path);
    notifyListeners();
  }

  //open gallery
  gallery(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    profileImage = File(image!.path);
    notifyListeners();
  }

}
