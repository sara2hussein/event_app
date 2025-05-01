import 'package:event_app/UI/home/tabs/floting_button/custom_elevated_button.dart';
import 'package:event_app/UI/home/tabs/love/custom_text_feild.dart';
import 'package:event_app/UI/intro/togle/image_toggle_switch.dart';
import 'package:event_app/UI/register/create_acc.dart';
import 'package:event_app/UI/register/forget_pass.dart';
import 'package:event_app/provider/languge_provider.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login_screen';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<LangugeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height * 0.02),
            Image.asset(AssetsManager.logo, height: height * 0.25),
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
            SizedBox(height: height * 0.01),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ForgetPass.routeName);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.forget_pass,

                    style: AppStyles.bold16Primary.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryLight,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            CustomElevatedButton(
              onButtonClick: login,
              text: AppLocalizations.of(context)!.login,
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.dont_have_acc,
                  style: AppStyles.medium16Black,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CreateAcc.routeName);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.create_account,
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
              children: [
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: AppColors.primaryLight,
                    indent: width * 0.02,
                    endIndent: width * 0.02,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.or,
                  style: AppStyles.bold16Primary,
                ),
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: AppColors.primaryLight,
                    indent: width * 0.02,
                    endIndent: width * 0.02,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Image.asset(AssetsManager.googlicon, height: 24),
              label: Text(
                AppLocalizations.of(context)!.login_with_google,
                style: AppStyles.medium16Primary,
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 20,
                ),
                side: BorderSide(color: AppColors.primaryLight),
              ),
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

  void login() {}
}
