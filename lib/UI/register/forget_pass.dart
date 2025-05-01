import 'package:event_app/UI/home/tabs/floting_button/custom_elevated_button.dart';
import 'package:event_app/UI/intro/intro_screen.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPass extends StatelessWidget {
  static const String routeName = '/forget_pass';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.forget_pass,
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
            Image.asset(AssetsManager.reseat_pass),
            SizedBox(height: height * 0.04),

            CustomElevatedButton(
              onButtonClick: () {
                 Navigator.of(context).pushNamed(IntroScreen.routeName);
              },
              text: AppLocalizations.of(context)!.reset_pass,
            ),
          ],
        ),
      ),
    );
  }
}
