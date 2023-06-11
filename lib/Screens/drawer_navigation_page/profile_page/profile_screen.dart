import 'package:community_app/Screens/drawer_navigation_page/profile_page/profile_tab_pages/address_profile_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/profile_page/profile_tab_pages/business_profile_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/profile_page/profile_tab_pages/job_profile_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/profile_page/profile_tab_pages/personal_profile_screen.dart';
import 'package:community_app/components/text_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {

  TabController? _tabController;
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: TextConst(
            text: 'Profile',
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.black,
            iconSize: 20,
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.grey,
            automaticIndicatorColorAdjustment: true,
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            labelStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            labelColor: Colors.black,
            tabs: const [
              Tab(
                text: 'PERSONAL',
              ),
              Tab(
                text: 'ADDRESS',
              ),
              // Tab(
              //   text: 'BUSINESS',
              // ),
              // Tab(
              //   text: 'JOB',
              // ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PersonalProfileScreen(number: '${_user!.phoneNumber!.substring(_user!.phoneNumber!.length - 10)}'),
            AddressProfileScreen(),
            // BusinessProfileScreen(),
            // JobProfileScreen(),
          ],
        ),
      ),
    );
  }
}
