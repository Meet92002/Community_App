import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_details_tab_page/business_tab_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_details_tab_page/family_tab_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_details_tab_page/other_tab_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_details_tab_page/personal_tab_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../components/text_const.dart';

class MatrimonyDetailsScreen extends StatefulWidget {
  final int infoIndex;
  const MatrimonyDetailsScreen({Key? key, required this.infoIndex}) : super(key: key);

  @override
  State<MatrimonyDetailsScreen> createState() => _MatrimonyDetailsScreenState();
}

class _MatrimonyDetailsScreenState extends State<MatrimonyDetailsScreen> {

  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: TextConst(
            text: 'Matrimony Details',
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
                text: 'BUSINESS',
              ),
              Tab(
                text: 'FAMILY',
              ),
              Tab(
                text: 'OTHER',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PersonalTabScreen(infoIndex: widget.infoIndex,),
            BusinessTabScreen(infoIndex: widget.infoIndex),
            FamilyTabScreen(infoIndex: widget.infoIndex),
            OtherTabScreen(infoIndex: widget.infoIndex),
          ],
        ),
      ),
    );
  }
}
