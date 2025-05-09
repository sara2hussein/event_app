import 'package:event_app/UI/home/tabs/floting_button/custom_elevated_button.dart';
import 'package:event_app/UI/home/tabs/love/custom_text_feild.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPass extends StatelessWidget {
  static const String routeName = '/forget_pass';
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.forget_pass,
          style: AppStyles.medium16Black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.02,
            ),
            child: Form(
               key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AssetsManager.reseat_pass),
                  SizedBox(height: height * 0.04),
                  CustomTextFeild(
                    prefixIcon: Image.asset(AssetsManager.IconEmail),
                    hintText: AppLocalizations.of(context)!.email,
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter email';
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(text);
                      if (!emailValid) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomElevatedButton(
                    onButtonClick: () {
                     
                    },
                    text: AppLocalizations.of(context)!.reset_pass,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void resetPassword(){}
}
