import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:flutter/material.dart';

typedef Myvalidator = String? Function(String?)?;

class CustomTextFeild extends StatelessWidget {
  Color? borderColor;
  String? hintText;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  String? lableText;
  TextStyle? lableStyle;
  Widget? suffixIcon;
  int? maxLines;
  Myvalidator validator;
  TextEditingController? controller;
  TextInputType keyboardInputType;
  bool? obscureText;
  CustomTextFeild({
    this.borderColor,
    this.controller,
    this.hintText,
    this.validator,
    this.hintStyle,
    this.prefixIcon,
    this.lableText,
    this.lableStyle,
    this.suffixIcon,
    this.maxLines,
    this.keyboardInputType = TextInputType.text,
    this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryLight,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardInputType ,
      obscureText: obscureText?? false,
      obscuringCharacter: '*',
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.redColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.redColor, width: 1),
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.medium16Gray,
        prefixIcon: prefixIcon,
        labelText: lableText,
        labelStyle: lableStyle ?? AppStyles.medium16Gray,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
