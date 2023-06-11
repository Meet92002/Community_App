import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/view_all_button_page/my_asks_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';
import '../view_my_leads_screen.dart';

class MyLeadsAsksTabScreen extends StatefulWidget {
  const MyLeadsAsksTabScreen({Key? key}) : super(key: key);

  @override
  State<MyLeadsAsksTabScreen> createState() => _MyLeadsAsksTabScreenState();
}

class _MyLeadsAsksTabScreenState extends State<MyLeadsAsksTabScreen> {
  TabController? _tabController;

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
            text: 'My Ask & Leads',
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          leading: IconButton(
            onPressed: () {
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
                text: 'MY LEADS',
              ),
              Tab(
                text: 'MY ASK',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ViewMyLeadsScreen(),
            MyAsksScreen(),
          ],
        ),
      ),
    );
  }
}
