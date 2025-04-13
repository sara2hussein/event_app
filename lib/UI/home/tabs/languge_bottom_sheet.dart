import 'package:event_app/utels/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 
class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();  

  
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {    
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.02), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.english,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: height * 0.04),
          Text(
            AppLocalizations.of(context)!.arabic,
            style:Theme.of(context).textTheme.headlineLarge
          ),
        ],
      ),
    );
  }
}