import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/my_leads_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/view_all_button_page/my_leads_asks_tab_page/my_leads_asks_tab_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/view_all_button_page/view_my_leads_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/view_all_button_page/view_quick_menu_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/profile_page/profile_screen.dart';
import 'package:community_app/components/quick_menu_const.dart';
import 'package:community_app/services/check_profile.dart';
import 'package:community_app/services/profile_shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/text_const.dart';
import '../../../main.dart';
import '../../../utils/color_const.dart';
import '../../../utils/image_const.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  CheckProfile checkProfile =  CheckProfile();
  List<String> carouselImages = [
    AssetImageConst.carousel,
    AssetImageConst.matrimonyCarousel,
    AssetImageConst.jobCarousel
  ];

  @override
  void initState() {
    // TODO: implement initState
    checkProfile0();
    super.initState();

    setupInteractedMessage();
    var initializationSettingsAndroid =new AndroidInitializationSettings('ic_launcher');
    var initialzationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings(  requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,);
    var initializationSettings = InitializationSettings(android: initialzationSettingsAndroid,iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: onSelectNotification);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onmessaggeeeeeee');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  // channel.description,
                  color: Colors.blue,
                  // TODO add a proper drawable resource to android, for now using
                  //      one that already exists in example app.
                  icon: "@mipmap/ic_launcher",

                ),
                iOS: IOSNotificationDetails(
                  presentAlert: true,  // Present an alert when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
                  presentBadge: true,  // Present the badge number when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
                  presentSound: true,
                  sound: "notification",
                  subtitle: channel.name,

                )
            ));
      }
    });
  }
  Future onSelectNotification(String? payload) async{
    Fluttertoast.showToast(msg: "onSelectNotification notification call before ");
    print("onMessage App notification call before ");
    await navigatorKey.currentState!.pushNamed('notification');

    // Navigator.push(context,CupertinoPageRoute(builder: (_) => NotificationPage()));
    print("onMessage App notification call after ");
    Fluttertoast.showToast(msg: "onSelectNotification notification call after ");

  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    navigatorKey.currentState!.pushNamed('notification');
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
        });
        return AlertDialog(
          icon: Image.asset(
            height: 80,
            width: 80,
            filterQuality: FilterQuality.high,
            AssetImageConst.submitted,
          ),
          title: TextConst(
            text: 'Please Complete Your Profile First!',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Poppins',
            color: AppColors.appBaseColor,
          ),
        );
      },
    );
  }

  Future checkProfile0() async {
     SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();



    if(checkProfile.isCheck(sharedPreferences: sharedPreferences)) {
      _showMyDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 03, left: 03),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 170.0,
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                itemCount: 3,
                itemBuilder: (context, itemIndex, realIndex) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        image: AssetImage(carouselImages[itemIndex]),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextConst(
                    text: 'Quick Menu',
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    textAlign: TextAlign.start,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewQuickMenuScreen()));
                    },
                    child: TextConst(
                      text: 'View All',
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5.70,
              child: GridView.builder(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 08, left: 08),
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 130,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            QuickMenuConst().pagesNavigator[index])),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black.withOpacity(.2)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: AppColors.circleAvatarColor,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: AppColors.appShadowColor,
                                child: Image(
                                  width: 30,
                                  height: 30,
                                  image: AssetImage(
                                      QuickMenuConst().gridimages[index]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 21,
                            child: Center(
                              child: TextConst(
                                textAlign: TextAlign.center,
                                text: QuickMenuConst().gridnames[index],
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 05, left: 10),
              child: TextConst(
                text: 'Recent Activity',
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 12,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemExtent: 220,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.black.withOpacity(.2)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.appShadowColor,
                                  radius: 20,
                                  child: TextConst(
                                    text: '$index',
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    textAlign: TextAlign.start,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                VerticalDivider(
                                  indent: 18,
                                  endIndent: 18,
                                  thickness: 1,
                                  width: 20,
                                  color: Colors.black.withOpacity(.2),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextConst(
                                      text: 'Activity Name',
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    TextConst(
                                      text: 'Member Directory',
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey,
                                      textAlign: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 05, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextConst(
                    text: 'My Leads',
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    textAlign: TextAlign.start,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyLeadsAsksTabScreen()));
                    },
                    child: TextConst(
                      text: 'View All',
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: 10),
              child: MyLeadsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
