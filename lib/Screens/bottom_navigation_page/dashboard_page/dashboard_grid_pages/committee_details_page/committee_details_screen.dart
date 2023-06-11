import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/committee_details_page/committee_grid_pages/event_committee_page/event_committee_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/committee_details_page/committee_grid_pages/finance_committee_page/finance_committee_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/committee_details_page/committee_grid_pages/management_committee_page/management_committee_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../utils/color_const.dart';
import '../../../../../utils/image_const.dart';
import 'committee_grid_pages/add_committee_page/add_committee_screen.dart';

class CommitteeDetailsScreen extends StatefulWidget {
  const CommitteeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CommitteeDetailsScreen> createState() => _CommitteeDetailsScreenState();
}

class _CommitteeDetailsScreenState extends State<CommitteeDetailsScreen> {

  List<String> gridimages = [
    AssetImageConst.finance,
    AssetImageConst.management,
    AssetImageConst.events,
    AssetImageConst.addNewCategory,
  ];

  List<String> gridnames = [
    "Finance\nCommittee",
    "Management\nCommittee",
    "Event\nCommittee",
    "Add New\nCommittee"
  ];

  List<Widget> pagesNavigator = [
    const FinanceCommitteeScreen(),
    const ManagementCommitteeScreen(),
    const EventCommitteeScreen(),
    const AddCommitteeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'Committee',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            mainAxisExtent: 150,
          ),
          itemCount: gridnames.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => pagesNavigator[index]));
              },
              child: Container(
                alignment: Alignment.center,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: AppColors.circleAvatarColor,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.appShadowColor,
                            child: Image.asset(
                              gridimages[index],
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        gridnames[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
