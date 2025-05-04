import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/model/event.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/firebase_utels.dart';
import 'package:event_app/utels/toast_utels.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventListProvide extends ChangeNotifier {
  List<Event> eventsList = [];
  List<Event> filterList = [];
  List<String> eventsNameList = [];
  int selectIndex = 0;
  List<String> getEventsNameList(BuildContext context) {
    return eventsNameList = [
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
  }

  List<Event> favoriteEventsList = [];
  void getAllEvent() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtels.getEventCollection().get();
    eventsList =
        querySnapshot.docs.map((doc) {
          return doc.data();
        }).toList();
    filterList = eventsList;

    filterList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    });
    notifyListeners();
  }

  void getFilterEvent() {
    filterList =
        eventsList.where((event) {
          return event.eventName == eventsNameList[selectIndex];
        }).toList();

    filterList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    });

    notifyListeners();
  }

  void updateIsFavoriteEvents(Event event) async {
    FirebaseUtels.getEventCollection()
        .doc(event.id)
        .update({'isFavoret': !event.isFavoret})
        .timeout(
          Duration(milliseconds: 500),
          onTimeout: () {

          },
        );
    ToastUtels.toastMsg(
      msg: 'Favorite updated successfully',
      backgroundColor: AppColors.primaryLight,
      textColor: AppColors.whiteColor,
    );
    selectIndex == 0 ? getAllEvent() : getFilterEventFromFirebase();
    print('selectedIndex: $selectIndex');
    getAllFavoretEvent();
  }

  void getFilterEventFromFirebase() async {
    var querySnapshot =
        await FirebaseUtels.getEventCollection()
            .where('eventName', isEqualTo: eventsNameList[selectIndex])
            .orderBy('dateTime')
            .get();
    filterList =
        querySnapshot.docs.map((doc) {
          return doc.data();
        }).toList();
  }

  void getAllFavoretEvent() async {
    var quarySnapshot =
        await FirebaseUtels.getEventCollection()
            .where('isFavoret', isEqualTo: true)
            .orderBy('dateTime')
            .get();
    favoriteEventsList =
        quarySnapshot.docs.map((doc) {
          return doc.data();
        }).toList();
    notifyListeners();
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectIndex = newSelectedIndex;
    selectIndex == 0 ? getAllEvent() : getFilterEvent();
  }
}
