import 'package:event_app/UI/home/tabs/languge_bottom_sheet.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:event_app/utels/app_styles.dart';

class ProfileTap extends StatefulWidget {
  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      AppLocalizations.of(context)!.arabic,
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
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
     builder: (context) => LanguageBottomSheet()
     );
  }
}
