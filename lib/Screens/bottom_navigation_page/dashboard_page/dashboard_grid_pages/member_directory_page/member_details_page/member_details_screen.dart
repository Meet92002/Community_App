import 'dart:convert';

import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/member_directory_page/member_details_page/member_details_tabs_page/member_business_tab_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/member_directory_page/member_details_page/member_details_tabs_page/member_personal_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import '../../../../../../components/text_const.dart';
import '../../../../../../models/member_directory_model.dart';
import '../../../../../../utils/app_url.dart';
import '../../../../../../utils/image_const.dart';

class MemberDetailsScreen extends StatefulWidget {
  final int infoIndex;
  const MemberDetailsScreen({Key? key, required this.infoIndex}) : super(key: key);

  @override
  State<MemberDetailsScreen> createState() => _MemberDetailsScreenState();
}

class _MemberDetailsScreenState extends State<MemberDetailsScreen> {
  TabController? _tabController;

  final BehaviorSubject<List<MemberData>> _streamBehaviour =
  BehaviorSubject<List<MemberData>>();

  Stream<List<MemberData>> get getStreamBehaviour => _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final MemberDirectoryModel? memberDirectoryModel = await getMemberApi();
    _streamBehaviour.sink.add(memberDirectoryModel!.memberData!);
  }

  Future<MemberDirectoryModel?> getMemberApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.memberDirectoryApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return MemberDirectoryModel.fromJson(jsonD);
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        title: TextConst(
          text: 'Member Details',
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 25,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.save_alt_rounded,
            ),
            color: Colors.black,
            iconSize: 25,
          ),
        ],
      ),
      body: StreamBuilder<List<MemberData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<MemberData>> snapshot) {
          if(!snapshot.hasData) {
            return Container();
          }
          if(snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'NO DATA FOUND!',
              ),
            );
          }
          var dataMap = snapshot.data!;
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.17,
                    color: Colors.grey.shade200,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height * 0.691,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 55.0),
                      child: Column(
                        children: [
                          TextConst(
                            text: dataMap[widget.infoIndex].name.toString(),
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                          TextConst(
                            text: dataMap[widget.infoIndex].castName.toString(),
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3.35,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      TextConst(
                                        text: 'Call',
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3.35,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.whatsapp,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 08,
                                      ),
                                      TextConst(
                                        text: 'Whatsapp',
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3.35,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.handshake_outlined,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      TextConst(
                                        text: '1-2-1',
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DefaultTabController(
                            length: 2,
                            initialIndex: 0,
                            child: Column(
                              children: [
                                TabBar(
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
                                  ],
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height / 2.15,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: TabBarView(
                                    children: [
                                      MemberPersonalTabScreen(infoIndex: widget.infoIndex),
                                      MemberBusinessTabScreen(infoIndex: widget.infoIndex),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 85,
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage(AssetImageConst.profile),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
