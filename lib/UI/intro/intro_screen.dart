import 'package:event_app/UI/intro/togle/image_toggle_switch.dart';
import 'package:event_app/provider/languge_provider.dart';
import 'package:event_app/provider/theme_provider.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/intro-screen';

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<LangugeProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset(AssetsManager.logo_top, height: 60)),

            SizedBox(height: height * 0.03),

            Image.asset(AssetsManager.introHeader, height: height * 0.4),

            SizedBox(height: height * 0.02),

            Text(
              AppLocalizations.of(context)!.h1,
              style: Theme.of(context).textTheme.bodyLarge,

              textAlign: TextAlign.center,
            ),

            SizedBox(height: height * 0.02),

            Text(
              AppLocalizations.of(context)!.choose,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),

            SizedBox(height: height * 0.06),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
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

            SizedBox(height: height * 0.01),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                ImageToggleSwitch(
                  firstImagePath: 'assets/images/shape.png',
                  secondImagePath: 'assets/images/Moon.png',
                  onToggle: (index) {
                    if (index == 0) {
                      themeProvider.changeTheme(ThemeMode.light);
                    } else {
                      themeProvider.changeTheme(ThemeMode.dark);
                    }
                  },
                ),
              ],
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/onboarding');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: AppColors.primaryLight,
                ),
                child: Text(
                  AppLocalizations.of(context)!.start,
                  style: AppStyles.regular20White,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
