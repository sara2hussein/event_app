import 'package:event_app/UI/home/tabs/app_event/events_tap.dart';
import 'package:event_app/UI/home/tabs/location/location_tap.dart';
import 'package:event_app/UI/home/tabs/love/love_tap.dart';
import 'package:event_app/UI/home/tabs/profile/profile_tap.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabsList = [EventsTap(), LocationTap(), LoveTap(), ProfileTap()];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(
          context,
        ).copyWith(canvasColor: AppColors.transparentColor),
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              builtBottomNavBarItems(
                index: 0,
                UnselectedIconName: AssetsManager.home_unselect,

                SelectedIconName: AssetsManager.home_icon,
                lable: AppLocalizations.of(context)!.home,
              ),
              builtBottomNavBarItems(
                UnselectedIconName: AssetsManager.loc_icon,
                index: 1,
                SelectedIconName: AssetsManager.loc_select,
                lable: AppLocalizations.of(context)!.map,
              ),
              builtBottomNavBarItems(
                UnselectedIconName: AssetsManager.love_icon,
                index: 2,
                SelectedIconName: AssetsManager.love_select,
                lable: AppLocalizations.of(context)!.love,
              ),
              builtBottomNavBarItems(
                UnselectedIconName: AssetsManager.user_icon,
                index: 3,
                SelectedIconName: AssetsManager.user_select,
                lable: AppLocalizations.of(context)!.profile,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: AppColors.whiteColor, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Expanded(child: tabsList[selectedIndex])],
      ),
    );
  }

  BottomNavigationBarItem builtBottomNavBarItems({
    required String UnselectedIconName,

    required int index,
    required String SelectedIconName,
    required String lable,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          selectedIndex == index ? SelectedIconName : UnselectedIconName,
        ),
        size: 22,
      ),
      label: lable,
    );
  }
}
