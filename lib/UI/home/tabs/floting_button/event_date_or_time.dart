import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/material.dart';

class EventDateOrTime extends StatelessWidget {
  String iconDataOrTime;
  String eventDateOrTime;
  String ChooseDateOrTime;
  Function onChooseDateOrTime;

  EventDateOrTime({
    required this.iconDataOrTime,
    required this.eventDateOrTime,
    required this.ChooseDateOrTime,
    required this.onChooseDateOrTime,
  });
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Image.asset(iconDataOrTime),
        SizedBox(width: width * 0.01),
        Expanded(child: Text(eventDateOrTime, style: AppStyles.medium16Black)),
        TextButton(
          onPressed: () {
            onChooseDateOrTime();
          },
          child: Text(ChooseDateOrTime, style: AppStyles.medium16Primary),
        ),
      ],
    );
  }
}
