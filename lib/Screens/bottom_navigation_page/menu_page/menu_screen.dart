// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/circular_page/circular_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/committee_details_page/committee_details_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/daily_report_page/daily_report_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/documents_page/documents_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/emergency_page/emergency_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/event_page/event_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/near_me_page/near_me_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/poll_page/poll_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/share_profile_page/share_profile_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/survey_page/survey_screen.dart';
import 'package:flutter/material.dart';
import '../../../utils/color_const.dart';
import '../dashboard_page/dashboard_grid_pages/buy_sell_page/buy_sell_screen.dart';
import '../dashboard_page/dashboard_grid_pages/job_module_page/job_module_screen.dart';
import '../dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_screen.dart';
import '../dashboard_page/dashboard_grid_pages/member_directory_page/member_directory_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
        child: Container(
          color: Colors.white,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HeaderWidget("Communication"),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 3,mainAxisSpacing: 3,mainAxisExtent: 135),
                delegate: SliverChildListDelegate(
                  [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MemberDirectoryScreen()));
                      },
                      child: BodyWidget("Member\nDirectory", "key_x", "phone-book.png"),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MatrimonyScreen()));
                      },
                      child: BodyWidget("Matrimony", "key_x", "rings.png"),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JobModuleScreen()));
                      },
                      child: BodyWidget("Job\nModule", "key_x", "briefcase.png"),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HeaderWidget("Events"),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 3,mainAxisSpacing: 3,mainAxisExtent: 135),
                delegate: SliverChildListDelegate(
                  [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EventScreen()));
                      },
                      child: BodyWidget("Events", "key_x", "calendar.png"),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HeaderWidget("Documents"),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 3,mainAxisSpacing: 3,mainAxisExtent: 135),
                delegate: SliverChildListDelegate(
                  [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CircularScreen()));
                      },
                      child: BodyWidget("Circular", "key_x", "note.png"),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DocumentsScreen()));
                      },
                      child: BodyWidget("Documents", "6", "binder.png"),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HeaderWidget("Q x A"),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 3,mainAxisSpacing: 3,mainAxisExtent: 135),
                delegate: SliverChildListDelegate(
                  [
                    // GestureDetector(
                    //   onTap: (){
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PollScreen()));
                    //   },
                    //   child: BodyWidget("Polls", "key_x", "list.png"),
                    // ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SurveyScreen()));
                      },
                      child: BodyWidget("Survey", "6", "queans.png"),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HeaderWidget("Emergency"),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 3,mainAxisSpacing: 3,mainAxisExtent: 135),
                delegate: SliverChildListDelegate(
                  [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmergencyScreen()));
                      },
                      child: BodyWidget("Emergency", "key_x", "megaphone.png"),
                    ),
                    // GestureDetector(
                    //   onTap: (){
                    //
                    //   },
                    //   child: BodyWidget("Complaint", "6", "cuffs.png"),
                    // ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HeaderWidget("Committee"),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 3,mainAxisSpacing: 3,mainAxisExtent: 135),
                delegate: SliverChildListDelegate(
                  [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CommitteeDetailsScreen()));
                      },
                      child: BodyWidget("Committee\nDetails", "key_x", "friends.png"),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HeaderWidget("Others"),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 3,mainAxisSpacing: 3,mainAxisExtent: 135),
                delegate: SliverChildListDelegate(
                  [
                    // GestureDetector(
                    //   onTap: (){
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ShareProfileScreen()));
                    //   },
                    //   child: BodyWidget("Share\nProfile", "key_x", "id-card.png"),
                    // ),
                    // GestureDetector(
                    //   onTap: (){
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NearMeScreen()));
                    //   },
                    //   child: BodyWidget("Near Me", "key_x", "nearby.png"),
                    // ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DailyReportScreen()));
                      },
                      child: BodyWidget("Daily\nReport", "key_x", "statistics.png"),
                    ),
                    // GestureDetector(
                    //   onTap: (){
                    //
                    //   },
                    //   child: BodyWidget("Geo Tag", "key_x", "geolocation.png"),
                    // ),
                    // GestureDetector(
                    //   onTap: (){
                    //
                    //   },
                    //   child: BodyWidget("Digital Card", "6", "qr-code.png"),
                    // ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BuySellScreen()));
                      },
                      child: BodyWidget("Buy / Sell", "6", "trolley.png"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final String text;

  HeaderWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2, top: 10),
      color: Colors.white,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String navigationKey;

  BodyWidget(this.title, this.navigationKey, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(.2),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.circleAvatarColor,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.appShadowColor,
                child: Image.asset(
                  "assets/images/$imagePath",
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              title,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
