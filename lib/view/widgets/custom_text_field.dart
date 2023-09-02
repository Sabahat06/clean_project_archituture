
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import '../../utils/colors.dart';
import '../../utils/dimension.dart';
import '../../utils/style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.textInputAction,
      this.isBorder = true,
      this.height,
      this.width,
      this.validator,
      this.onChanged,
      this.onSubmitted,
      this.borderColor = greyLight,
      this.hintColor = greyPrimary,
      this.isPassword = false,
      this.isSearch = false,
      this.onSuffixIconTap,
      this.radius = 25,
      this.fillColor = whiteLight,
      this.isVisible = false,
      this.inputFormatter = 50,
      this.iconColor = greyPrimary,
      this.isEdit = false,
      this.isReadOnly = false,
      this.onTap,
      this.isDropDownSelect= false,
      this.isSendSelect=false});
  TextEditingController controller;
  String? hintText;
  bool? obscureText;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  bool isBorder;
  double? height;
  double? width;
  bool isVisible;
  Color iconColor;
  bool isEdit;
  bool isDropDownSelect;
  bool isSendSelect;
  bool isReadOnly;

  Color borderColor;
  Color hintColor;
  bool isSearch;
  bool isPassword;
  double radius;
  Color fillColor;
  int inputFormatter;

  VoidCallback? onSuffixIconTap;
  VoidCallback? onTap;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
          readOnly: isReadOnly,
          autofocus: false,
          cursorColor: yellowPrimary,
          controller: controller,
          autovalidateMode: controller.text.isNotEmpty
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction,
          style: const TextStyle(fontSize: 14, color: whitePrimary),
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          textInputAction: textInputAction,
          onTap: onTap,
          inputFormatters: [LengthLimitingTextInputFormatter(inputFormatter)],
          decoration: InputDecoration(
            errorStyle: const TextStyle(fontSize: 12, color: redPrimary, fontFamily: sofiaRegular),
            fillColor: fillColor,
            filled: isBorder == true ? true : false,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 14, color: greyTextColor, fontFamily: sofiaRegular),

            suffixIcon: InkWell(
              onTap: onSuffixIconTap,
              child: isPassword == true
                  ? Icon(
                    isVisible == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: iconColor,
                    size: 20.w,
                  )
                  : isSearch == true
                      ? Icon(
                          Icons.search_outlined,
                          color: iconColor,
                          size: 25.w,
                        )
                      : isEdit == true
                          ? Icon(
                              Icons.edit,
                              color: iconColor,
                              size: 20.w,
                            )
                          : isDropDownSelect
                            ? Icon(
                              Icons.keyboard_arrow_down,
                              color: iconColor,
                              size: 20.w,
                            )
                              : isSendSelect
                                ? Icon(
                                  Icons.send,
                                  color: iconColor,
                                  size: 20.w,
                                )
                                : const SizedBox(),
            ),
            // Content padding is the inside padding of the text field
            contentPadding: isBorder == true
                ? EdgeInsets.symmetric(vertical: 10.h, horizontal: 20)
                : null,

            border: isBorder == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: BorderSide(color: borderColor, width: 1),
                  )
                : InputBorder.none,

            errorBorder: isBorder == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: const BorderSide(color: redPrimary, width: 1),
                  )
                : InputBorder.none,

            focusedErrorBorder: isBorder == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: const BorderSide(color: redPrimary, width: 1.2),
                  )
                : InputBorder.none,

            enabledBorder: isBorder == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: BorderSide(color: borderColor, width: 1),
                  )
                : InputBorder.none,

            focusedBorder: isBorder == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: const BorderSide(color: yellowPrimary, width: 1),
                  )
                : InputBorder.none,
          )),
    );
  }
}
