import 'package:event_app/provider/languge_provider.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<LangugeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeLanguge('en');
            },
            child:
                languageProvider.currentLocal == 'en'
                    ? getSelectedItemWidget(
                      AppLocalizations.of(context)!.english,
                    )
                    : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.english,
                    ),
          ),
          SizedBox(height: height * 0.04),
          InkWell(
            onTap: () {
              languageProvider.changeLanguge('ar');
            },
            child:
                languageProvider.currentLocal == 'ar'
                    ? getSelectedItemWidget(
                      AppLocalizations.of(context)!.arabic,
                    )
                    : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.arabic,
                    ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(color: AppColors.primaryLight),
        ),
        Icon(Icons.check, size: 35, color: AppColors.primaryLight),
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(text, style: Theme.of(context).textTheme.headlineMedium);
  }
}
