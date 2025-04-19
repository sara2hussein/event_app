import 'dart:ui_web';

import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventsTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welecome,
                  style: AppStyles.regular14White,
                ),
                Text('John Safwat', style: AppStyles.bold24White),
              ],
            ),
            Image.asset(AssetsManager.sun_icon),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteColor,
              ),
              child: Text('EN', style: AppStyles.bold14Primary),
            ),
          ],
        ),
      ),
    );
  }
}
