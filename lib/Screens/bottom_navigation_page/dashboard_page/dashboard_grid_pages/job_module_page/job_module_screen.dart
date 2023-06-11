import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/job_module_page/job_module_grid_pages/job_module_company_page/job_module_company_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/job_module_page/job_module_grid_pages/job_module_freelance_page/job_module_freelance_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../components/icon_button_const.dart';
import '../../../../../components/text_const.dart';
import '../../../../../components/text_field_const.dart';
import '../../../../../utils/color_const.dart';
import '../../../../../utils/image_const.dart';
import '../matrimony_page/matrimony_screen.dart';

class JobModuleScreen extends StatefulWidget {
  const JobModuleScreen({Key? key}) : super(key: key);

  @override
  State<JobModuleScreen> createState() => _JobModuleScreenState();
}

class _JobModuleScreenState extends State<JobModuleScreen> {

  TextEditingController searchController = TextEditingController();

  List<String> gridimages = [
    AssetImageConst.company,
    AssetImageConst.freelance
  ];

  List<String> gridnames = [
    "Company",
    "Freelance"
  ];

  List<Widget> pagesNavigator = [
    const JobModuleCompanyScreen(),
    const JobModuleFreelanceScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'Job Module',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 05),
            child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: TextFieldConst(
                controller: searchController,
                readOnly: false,
                filled: false,
                onTap: () {},
                textAlignVertical: TextAlignVertical.bottom,
                hintText: 'Search Popular Jobs',
                iconData: Icons.search,
                iconColor: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6.05,
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
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConst(
                  text: 'Popular Jobs',
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textAlign: TextAlign.start,
                ),
                GestureDetector(
                  onTap: () {

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
            padding: const EdgeInsets.only(top: 08),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.684,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 05,right: 05),
                    child: Card(
                      elevation: 0,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: Colors.black.withOpacity(.3)),
                      ),
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.only(left: 10,right: 05),
                        leading: Icon(
                          Icons.account_circle_rounded,
                          size: 40,
                        ),
                        title: TextConst(
                          text: 'Google Job Hiring',
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black,
                          letterSpacing: 1.5,
                        ),
                        subtitle: TextConst(
                          text: 'Androtech Solution Pvt. Ltd.',
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 1.5,
                        ),
                        trailing: IconButtonConst(
                          icon: Icons.arrow_forward_ios_rounded,
                          iconSize: 20,
                          color: Colors.grey,
                          function: () {},
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
