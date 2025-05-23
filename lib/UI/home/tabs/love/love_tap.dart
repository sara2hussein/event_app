import 'package:event_app/UI/home/tabs/app_event/event_item.dart';
import 'package:event_app/UI/home/tabs/love/custom_text_feild.dart';
import 'package:event_app/provider/event_list_provide.dart';
import 'package:event_app/provider/user_provider.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoveTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var eventListProvider = Provider.of<EventListProvide>(context);
        var userProvider = Provider.of<UserProvider>(context);

    if (eventListProvider.favoriteEventsList.isEmpty) {
      eventListProvider.getAllFavoretEvent(userProvider.currentUser!.id);
    }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            SizedBox(height: height * 0.08),
            CustomTextFeild(
              borderColor: AppColors.primaryLight,
              hintText: AppLocalizations.of(context)!.search,
              hintStyle: AppStyles.bold14Primary,
              prefixIcon: Image.asset(AssetsManager.search_event),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child:
                  eventListProvider.favoriteEventsList.isEmpty
                      ? Center(
                        child: Text(
                          AppLocalizations.of(context)!.no_items_fav_found,
                          style: AppStyles.medium16Black,
                        ),
                      )
                      : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.01,
                              vertical: height * 0.01,
                            ),
                            child: EventItem(
                              event:
                                  eventListProvider.favoriteEventsList[index],
                            ),
                          );
                        },

                        itemCount: eventListProvider.favoriteEventsList.length,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
