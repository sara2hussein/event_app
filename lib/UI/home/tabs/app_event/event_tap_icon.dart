import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:flutter/material.dart';

class EventTapIcon extends StatelessWidget {
  String eventName;
  bool isSelected;
  EventTapIcon({required this.eventName, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
      decoration: BoxDecoration(
        color:
            isSelected
                ? Theme.of(context).focusColor
                : AppColors.transparentColor,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: AppColors.whiteColor, width: 1),
      ),
      child: Text(
        eventName,
        style: isSelected ? Theme.of(context).textTheme.headlineSmall : AppStyles.medium16White,
      ),
    );
  }
}
