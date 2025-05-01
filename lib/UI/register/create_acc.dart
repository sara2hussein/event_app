import 'package:event_app/UI/home/tabs/floting_button/custom_elevated_button.dart';
import 'package:event_app/UI/home/tabs/love/custom_text_feild.dart';
import 'package:event_app/UI/intro/togle/image_toggle_switch.dart';
import 'package:event_app/UI/register/lodin_screen.dart';
import 'package:event_app/provider/languge_provider.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CreateAcc extends StatelessWidget {
  static const String routeName = '/create_acc';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<LangugeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.create_account,
          style: AppStyles.medium16Black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetsManager.logo, height: height * 0.20),
            SizedBox(height: height * 0.02),
            CustomTextFeild(
              prefixIcon: Image.asset(AssetsManager.IconUser),
              hintText: AppLocalizations.of(context)!.name,
              controller: emailController,
              validator: (text) {},
            ),
            SizedBox(height: height * 0.02),
            CustomTextFeild(
              prefixIcon: Image.asset(AssetsManager.IconEmail),
              hintText: AppLocalizations.of(context)!.email,
              controller: emailController,
              validator: (text) {},
            ),
            SizedBox(height: height * 0.02),
            CustomTextFeild(
              prefixIcon: Image.asset(AssetsManager.IconPass),
              hintText: AppLocalizations.of(context)!.password,
              suffixIcon: Image.asset(AssetsManager.eye_slash),
              controller: passwordController,
              validator: (text) {},
            ),
            SizedBox(height: height * 0.02),
            CustomTextFeild(
              prefixIcon: Image.asset(AssetsManager.IconPass),
              hintText: AppLocalizations.of(context)!.re_password,
              suffixIcon: Image.asset(AssetsManager.eye_slash),
              controller: passwordController,
              validator: (text) {},
            ),
            SizedBox(height: height * 0.02),

            CustomElevatedButton(
              onButtonClick: () {}, // void login,
              text: AppLocalizations.of(context)!.create_account,
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.already_have_acc,
                  style: AppStyles.medium16Black,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: AppStyles.medium16Primary.copyWith(
                      decorationColor: AppColors.primaryLight,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                ImageToggleSwitch(
                  firstImagePath: 'assets/images/LR.png',
                  secondImagePath: 'assets/images/EG.png',
                  onToggle: (index) {
                    if (index == 0) {
                      languageProvider.changeLanguge("en");
                    } else {
                      languageProvider.changeLanguge("ar");
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
