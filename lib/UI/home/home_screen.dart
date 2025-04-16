import 'package:event_app/UI/home/tabs/app_event/events_tap.dart';
import 'package:event_app/UI/home/tabs/floting_button/creat_new_event.dart';
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

  List<Widget> tabsList = [
    EventsTap(),
    LocationTap(),
    CreatNewEvent(), // زرار +
    LoveTap(),
    ProfileTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ بدون FloatingActionButton
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.primaryLight),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.whiteBgColor,
          unselectedItemColor: AppColors.whiteBgColor,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _buildBottomNavItem("assets/images/home_icon.png", "Home", 0),
            _buildBottomNavItem("assets/images/location_icon.png", "Map", 1),
            _buildBottomNavItem(
              "assets/images/add_icon.png",
              "",
              2,
            ), // زرار + في النص
            _buildBottomNavItem("assets/images/heart_icon.png", "Love", 3),
            _buildBottomNavItem("assets/images/user_icon.png", "Profile", 4),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Expanded(child: tabsList[selectedIndex])],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
    String imagePath,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(imagePath)),
      activeIcon: ImageIcon(AssetImage(imagePath), color: Colors.white),
      label: label,
    );
  }
}
