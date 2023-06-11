import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_add_details_page/matrimony_add_details_tab_page/business_details_form_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_add_details_page/matrimony_add_details_tab_page/other_details_form_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_add_details_page/matrimony_add_details_tab_page/personal_details_form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../components/text_const.dart';
import 'matrimony_add_details_tab_page/family_details_form_screen.dart';

class MatrimonyAddDetailsScreen extends StatefulWidget {
  final int initialindex;
  MatrimonyAddDetailsScreen({Key? key, required this.initialindex}) : super(key: key);

  @override
  State<MatrimonyAddDetailsScreen> createState() => _MatrimonyAddDetailsScreenState();
}

class _MatrimonyAddDetailsScreenState extends State<MatrimonyAddDetailsScreen> {

  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: widget.initialindex,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: TextConst(
            text: 'Matrimony Form',
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
            PersonalDetailsFormScreen(),
            BusinessDetailsFormScreen(),
            FamilyDetailsFormScreen(),
            OtherDetailsFormScreen(),
          ],
        ),
      ),
    );
  }
}
