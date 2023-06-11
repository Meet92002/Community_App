import 'dart:convert';

import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/job_module_page/job_module_grid_pages/job_module_freelance_page/freelance_services_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/job_module_page/job_module_grid_pages/job_module_freelance_page/popular_job_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../components/app_bar_const.dart';
import '../../../../../../../components/text_const.dart';
import '../../../../../../../models/all_company_list_model.dart';
import '../../../../../../../utils/app_url.dart';
import '../../../../../../../utils/color_const.dart';
import '../../../../../../../utils/image_const.dart';
import 'package:http/http.dart' as http;

import 'freelance_recent_works_screen.dart';

class JobModuleFreelanceScreen extends StatefulWidget {
  const JobModuleFreelanceScreen({Key? key}) : super(key: key);

  @override
  State<JobModuleFreelanceScreen> createState() =>
      _JobModuleFreelanceScreenState();
}

class _JobModuleFreelanceScreenState extends State<JobModuleFreelanceScreen> {
  Future<AllCompanyListModel?> getAllCompunyData() async {
    print("get all compuany data call");
    try {
      var request = http.Request(
          'GET', Uri.parse(AppUrl.freelanceJobsTypeApi));

      http.StreamedResponse response = await request.send();
      print("reponse code is  printed before : ${response.statusCode}");
      if (response.statusCode == 200) {
        print("reponse code is  200");
        var jsonD = jsonDecode(await response.stream.bytesToString());
        return AllCompanyListModel.fromJson(jsonD);
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("exception throw by catch : e : $e");
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  List<String> jobImages = [
    AssetImageConst.logoDesign,
    AssetImageConst.uiux,
    AssetImageConst.appDevelop,
    AssetImageConst.webDevelop,
    AssetImageConst.desktopDevelop
  ];

  get index => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'Freelance',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_ios_rounded,
          iconColor: Colors.black,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 05, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextConst(
                    text: 'Freelance Jobs',
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
            SizedBox(
              height: 170,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 05, right: 05),
                child: FutureBuilder<AllCompanyListModel?>(
                  future: getAllCompunyData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 5.630,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Shimmer.fromColors(
                                baseColor: Colors.black26,
                                highlightColor: Colors.black12,
                                child: Container(
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(.2),
                                    ),
                                    color: Colors.white30,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(left: 05,right: 05),
                      child: ListView.builder(
                        itemCount: snapshot.data!.companyTypeData!.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PopulerJobDetails(
                                    id: snapshot
                                        .data!.companyTypeData![index].sId,
                                    text: snapshot.data!.companyTypeData![index].companyType,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 05, right: 10),
                              child: Container(
                                width: 140,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black.withOpacity(.2),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(09),
                                          topRight: Radius.circular(09),
                                        ),
                                        // color: Colors.amberAccent,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(jobImages[index]),
                                        ),
                                      ),
                                    ),
                                    // Image.network(snapshot.data!.companyTypeData![index].companyType!),
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Text(
                                          snapshot.data!.companyTypeData![index]
                                              .companyType!
                                              .toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextConst(
                    text: 'Freelance Works',
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
              child: FreelanceRecentWorksScreen(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextConst(
                    text: 'Freelance Services',
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
              child: FreelanceServicesScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
