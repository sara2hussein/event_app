import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  Color? borderColor;
  String? hintText;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  String? lableText;
  TextStyle? lableStyle;
  Widget? suffixIcon;
  CustomTextFeild({
    this.borderColor,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.lableText,
    this.lableStyle,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryLight,
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
