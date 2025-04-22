import 'package:event_app/UI/home/tabs/app_event/event_item.dart';
import 'package:event_app/UI/home/tabs/app_event/event_tap_icon.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventsTap extends StatefulWidget {
  @override
  State<EventsTap> createState() => _EventsTapState();
}

class _EventsTapState extends State<EventsTap> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
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
            Spacer(),
            Image.asset(AssetsManager.sun_icon),
            SizedBox(width: width * 0.03),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteColor,
              ),
              child: Text('EN', style: AppStyles.bold14Primary),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.13,
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Image.asset(AssetsManager.loc_icon),
                    SizedBox(width: width * 0.01),
                    Text('Cairo , Egypt', style: AppStyles.medium14White),
                  ],
                ),
                SizedBox(height: height * 0.01),
                DefaultTabController(
                  length: eventsNameList.length,
                  child: TabBar(
                    onTap: (index) {
                      selectIndex = index;
                      setState(() {});
                    },
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: AppColors.transparentColor,
                    dividerColor: AppColors.transparentColor,

                    labelPadding: EdgeInsets.zero,

                    tabs:
                        eventsNameList.map((eventName) {
                          return EventTapIcon(
                            eventName: eventName,
                            isSelected:
                                selectIndex ==
                                eventsNameList.indexOf(eventName),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  child: EventItem(),
                );
              },

              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
