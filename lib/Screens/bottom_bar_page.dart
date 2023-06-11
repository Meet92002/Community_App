import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/menu_page/menu_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/social_media_page/social_media_screen.dart';
import 'package:community_app/Screens/qr_code/qr_code_screen.dart';
import 'package:community_app/Screens/welcome_page/welcome_screen.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';

import '../components/text_const.dart';
import 'drawer_navigation_page.dart';
import 'drawer_navigation_page/notification_page/notification_screen.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int currentIndex = 0;
  final screens = [
    const DashBoardScreen(),
    const SocialMediaScreen(),
    const MenuScreen(),
  ];

  List<String> appBarTitle = [
    '',
    'Feed',
    'Menu'
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => WelcomeScreen(),
          ),
              (route) => false,
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 5,
          backgroundColor: Colors.white,
          title: TextConst(
            text: appBarTitle[currentIndex],
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 25,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 05),
            child: IconButton(
              icon: new Image.asset(
                width: 27,
                height: 27,
                AssetImageConst.drawer,
              ),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrCodeScreen()));
              },
              icon: new Image.asset(
                width: 24,
                height: 24,
                AssetImageConst.digitalCard,
              ),
              color: Colors.black,
              iconSize: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 05),
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationScreen()));
                },
                icon: new Image.asset(
                  width: 25,
                  height: 25,
                  AssetImageConst.homeNotification,
                ),
                color: Colors.black,
                iconSize: 25,
              ),
            ),
          ],
        ),
        drawer: const DrawerNavigationPage(),
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index!),
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
          tilesPadding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          elevation: 10,
          hasNotch: true,
          hasInk: true,
          inkColor: Colors.black12,
          items: const <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: AppColors.appBaseColor,
              icon: Icon(
                Icons.home_rounded,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home_rounded,
                color: Colors.black,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: AppColors.appBaseColor,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              title: Text(
                "Feed",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: AppColors.appBaseColor,
              icon: Icon(
                Icons.grid_view_rounded,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.grid_view_rounded,
                color: Colors.black,
              ),
              title: Text(
                "Menu",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
