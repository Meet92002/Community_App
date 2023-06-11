import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/job_module_page/job_module_grid_pages/job_module_company_page/companies_list_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/job_module_page/job_module_grid_pages/job_module_company_page/company_grid_pages/company_bid_on_work_page/company_bid_on_work_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/job_module_page/job_module_grid_pages/job_module_company_page/company_grid_pages/company_post_job_offer_page/company_post_job_offer_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/job_module_page/job_module_grid_pages/job_module_company_page/company_services_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/job_module_page/job_module_grid_pages/job_module_company_page/recent_works_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../../../components/app_bar_const.dart';
import '../../../../../../../components/text_const.dart';
import '../../../../../../../utils/color_const.dart';
import '../../../../../../../utils/image_const.dart';

class JobModuleCompanyScreen extends StatefulWidget {
  const JobModuleCompanyScreen({Key? key}) : super(key: key);

  @override
  State<JobModuleCompanyScreen> createState() => _JobModuleCompanyScreenState();
}

class _JobModuleCompanyScreenState extends State<JobModuleCompanyScreen> {

  List<String> gridimages = [AssetImageConst.bid, AssetImageConst.offer];

  List<String> gridnames = ["Bid on Work", "Post Job Offer"];

  List<Widget> pagesNavigator = [
    const CompanyBidOnWorkScreen(),
    const CompanyPostJobOfferScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'Company',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: GridView.builder(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 10, left: 10),
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 130,
              ),
              itemCount: gridnames.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => pagesNavigator[index])),
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
                                image: AssetImage(gridimages[index]),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 21,
                          child: Center(
                            child: TextConst(
                              textAlign: TextAlign.center,
                              text: gridnames[index],
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
          Divider(
            color: Colors.black.withOpacity(.2),
            indent: 10,
            endIndent: 10,
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConst(
                  text: 'Companies',
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textAlign: TextAlign.start,
                ),
                GestureDetector(
                  onTap: () {},
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
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: CompaniesListScreen(),
          ),
          Divider(
            color: Colors.black.withOpacity(.2),
            indent: 10,
            endIndent: 10,
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConst(
                  text: 'Popular Services',
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textAlign: TextAlign.start,
                ),
                GestureDetector(
                  onTap: () {},
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
            padding: EdgeInsets.only(top: 15, right: 10, left: 10),
            child: CompanyServicesScreen(),
          ),
          Divider(
            color: Colors.black.withOpacity(.2),
            indent: 10,
            endIndent: 10,
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConst(
                  text: 'Recent Works',
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textAlign: TextAlign.start,
                ),
                GestureDetector(
                  onTap: () {},
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
            padding: EdgeInsets.only(right: 10, left: 10, top: 15),
            child: RecentWorksScreen(),
          ),
        ],
      ),
    );
  }
}
