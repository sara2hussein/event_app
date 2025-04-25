import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:flutter/material.dart';

class EventTapIcon extends StatelessWidget {
  String eventName;
  bool isSelected;
  Color selectedBackgroundColor;
  TextStyle? selectedTextStyle;
  TextStyle? unSelectedTextStyle;
  Color? borderColor;
  EventTapIcon({
    required this.eventName,
    required this.isSelected,
    required this.selectedBackgroundColor,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
     this.borderColor
  });
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
            isSelected ? selectedBackgroundColor : AppColors.transparentColor,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: borderColor?? AppColors.whiteColor, width: 1),
      ),
      child: Text(
        eventName,
        style: isSelected ? selectedTextStyle : unSelectedTextStyle,
      ),
    );
  }
}
