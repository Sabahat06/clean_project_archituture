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

import '../../widgets/show_loader.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {

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
                        Icon(Icons.clear, size: 20.w, color: whitePrimary,).onPress(() {
                          Navigator.pop(context);
                        }),
                        "Profile".toText(color: whitePrimary, fontSize: 20, fontWeight: FontWeight.w500),
                        controller.isUpdateUserLoading
                            ? showLoader(size: 20)
                            : Icon(Icons.done, size: 20.w, color: whitePrimary,).onPress(() {
                          controller.updateUser(context);
                        }),
                      ],
                    ),

                    25.height,

                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.w),
                          // child: Image.asset(Images.homeScreenTabImageOne, fit: BoxFit.cover,height: 100.w, width: 100.w,)
                          child: controller.profileImage == null && (controller.authModel.user!.profilePhoto == null || controller.authModel.user!.profilePhoto == '')
                            ? Image.asset(Images.people, fit: BoxFit.cover,height: 100.w, width: 100.w,)
                            : controller.profileImage != null
                              ? Image.file(controller.profileImage!, fit: BoxFit.cover,height: 100.w, width: 100.w,)
                              : ShimmerImage(imageUrl: controller.authModel.user!.profilePhoto!, width: 100.w, height: 100.w)

                        ).center,
                        Positioned(
                          bottom: -3,
                          left: 175.w,
                          child: InkWell(
                            onTap: () async {
                              await showImagePicker(context: context);
                              controller.notifyListeners();
                            },
                            child: CircleAvatar(
                              radius: 18.w,
                              backgroundColor: yellowPrimary,
                              child: Icon(
                                Icons.camera_alt,
                                size: 20.w,
                                color: whitePrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    20.height,
                    name.toText(color: whitePrimary, fontSize: 14),

                    10.height,
                    CustomTextField(
                      controller: controller.editNameTextEditingController,
                      // height: 50.h,
                      fillColor: textFieldColor,
                      borderColor: textFieldColor,
                      hintText: name,
                      radius: 5,
                      validator: (value) {
                        return Validation.nameValidation(value);
                      },
                    ),
                    15.height,

                    email.toText(color: whitePrimary, fontSize: 14),
                    10.height,
                    CustomTextField(
                      controller: controller.editEmailTextEditingController,
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
                    15.height,

                    phoneNumber.toText(color: whitePrimary, fontSize: 14),
                    10.height,
                    CustomTextField(
                      controller: controller.editPhoneTextEditingController,
                      // height: 50.h,
                      fillColor: textFieldColor,
                      borderColor: textFieldColor,
                      hintText: phoneNumber,
                      radius: 5,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        return Validation.phoneValidation(value);
                      },
                    ),
                    15.height,

                    blockchainAddress.toText(color: whitePrimary, fontSize: 14),
                    10.height,
                    CustomTextField(
                      controller: controller.editBlockchainTextEditingController,
                      // height: 50.h,
                      fillColor: textFieldColor,
                      borderColor: textFieldColor,
                      hintText: blockchainAddress,
                      radius: 5,
                      validator: (value) {
                        return Validation.blockChainAddressValidation(value);
                      },
                    ),
                    30.height,

                  ],
                ).paddingSymmetric(horizontal: 18.w),
              ),
            );
          }),
        )
      ),
    );
  }
}
