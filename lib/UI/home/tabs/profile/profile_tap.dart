import 'package:event_app/UI/home/tabs/profile/languge_bottom_sheet.dart';
import 'package:event_app/UI/home/tabs/profile/theme_bottom_sheet.dart';
import 'package:event_app/UI/register/lodin_screen.dart';
import 'package:event_app/provider/languge_provider.dart';
import 'package:event_app/provider/theme_provider.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatefulWidget {
  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<LangugeProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: height * 0.18,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(46)),
        ),
        titleSpacing: -30,
        title: Row(
          children: [
            Image.asset(
              AssetsManager.routeImage,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(width: width * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'John Safwat',
                    style: AppStyles.bold24White,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'johnsafwat.route@gmail.com',
                    style: AppStyles.medium16White,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.02),
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            InkWell(
              onTap: () {
                showLanguageBottomSheet();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.02),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.01,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryLight, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageProvider.currentLocal == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: AppStyles.bold20Primary,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.primaryLight,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            // SizedBox(height: height * 0.02),
            InkWell(
              onTap: () {
                showThemeBottomSheet();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.02),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.01,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryLight, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.currentTheme == ThemeMode.light
                          ? AppLocalizations.of(context)!.light
                          : AppLocalizations.of(context)!.dark,
                      style: AppStyles.bold20Primary,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.primaryLight,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: height * 0.02,
                ),
              ),
              onPressed: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(LoginScreen.routeName);
              },
              child: Row(
                children: [
                  Icon(Icons.logout, color: AppColors.whiteColor),
                  Text(
                    AppLocalizations.of(context)!.logout,
                    style: AppStyles.regular20White,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
