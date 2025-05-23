import 'package:event_app/UI/home/tabs/app_event/event_item.dart';
import 'package:event_app/UI/home/tabs/app_event/event_tap_icon.dart';
import 'package:event_app/provider/event_list_provide.dart';
import 'package:event_app/provider/user_provider.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EventsTap extends StatefulWidget {
  @override
  State<EventsTap> createState() => _EventsTapState();
}

class _EventsTapState extends State<EventsTap> {
  @override
  Widget build(BuildContext context) {
    var eventListprovider = Provider.of<EventListProvide>(context);
    var userProvider = Provider.of<UserProvider>(context);
        
    eventListprovider.getEventsNameList(context);
    if (eventListprovider.eventsList.isEmpty) {
      eventListprovider.getAllEvent(userProvider.currentUser!.id);
    }
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
                Text(userProvider.currentUser!.name, style: AppStyles.bold24White),
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
                  length: eventListprovider.eventsNameList.length,
                  child: TabBar(
                    onTap: (index) {
                      eventListprovider.changeSelectedIndex(index,userProvider.currentUser!.id);
                    },
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: AppColors.transparentColor,
                    dividerColor: AppColors.transparentColor,

                    labelPadding: EdgeInsets.zero,

                    tabs:
                        eventListprovider.eventsNameList.map((eventName) {
                          return EventTapIcon(
                            selectedBackgroundColor:
                                Theme.of(context).focusColor,
                            selectedTextStyle:
                                Theme.of(context).textTheme.headlineSmall,
                            unSelectedTextStyle: AppStyles.medium16White,
                            eventName: eventName,
                            isSelected:
                                eventListprovider.selectIndex ==
                                eventListprovider.eventsNameList.indexOf(
                                  eventName,
                                ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                eventListprovider.filterList.isEmpty
                    ? Center(
                      child: Text(
                        AppLocalizations.of(context)!.no_items_found,
                        style: AppStyles.medium16Black,
                      ),
                    ) //
                    : ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.02,
                          ),
                          child: EventItem(
                            event: eventListprovider.filterList[index],
                          ),
                        );
                      },

                      itemCount: eventListprovider.filterList.length,
                    ),
          ),
        ],
      ),
    );
  }
}
