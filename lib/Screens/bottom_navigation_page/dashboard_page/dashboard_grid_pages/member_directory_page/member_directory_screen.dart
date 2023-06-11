import 'dart:convert';
import 'dart:io' show Platform;
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/member_directory_page/add_member_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/member_directory_page/member_details_page/member_details_screen.dart';
import 'package:community_app/components/icon_button_const.dart';
import 'package:community_app/components/text_const.dart';
import 'package:community_app/components/text_field_const.dart';
import 'package:community_app/models/member_directory_model.dart';
import 'package:community_app/utils/app_url.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../../../../../components/app_bar_const.dart';
import 'package:shimmer/shimmer.dart';

class MemberDirectoryScreen extends StatefulWidget {
  const MemberDirectoryScreen({Key? key}) : super(key: key);

  @override
  State<MemberDirectoryScreen> createState() => _MemberDirectoryScreenState();
}

class _MemberDirectoryScreenState extends State<MemberDirectoryScreen> {
  TextEditingController searchController = TextEditingController();

  List<MemberData> searchMemberList = [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'Member Directory',
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
      body: StreamBuilder<List<MemberData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<MemberData>> snapshot) {
          if (!snapshot.hasData) {
            return Column(
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
                      readOnly: true,
                      filled: false,
                      onTap: () {},
                      textAlignVertical: TextAlignVertical.bottom,
                      hintText: 'Search Here',
                      iconData: Icons.search,
                      iconColor: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 05,right: 10,left: 10,bottom: 05),
                  child: Shimmer.fromColors(
                    baseColor: Colors.black26,
                    highlightColor: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.17,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 10,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.17,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 10,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 09,
                    itemBuilder: (BuildContext context, int index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.black26,
                        highlightColor: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 05, left: 10, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black.withOpacity(.3),
                              ),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.only(left: 10,right: 10),
                                  dense: true,
                                  title: Padding(
                                    padding: const EdgeInsets.only(right: 120.0),
                                    child: Container(
                                      height: 10,
                                      width: 79,
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(right: 60.0),
                                    child: Container(
                                      height: 08,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                  ),
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
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
                ),
              ],
            );
          }
          if(snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'NO DATA FOUND!',
              ),
            );
          }
          var dataMap = snapshot.data!;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 05),
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
                    onChanged: (val) {
                      searchMemberList = dataMap.where((element) {
                        return element.name!
                            .toLowerCase()
                            .contains(val.toLowerCase());
                      }).toList();
                      setState(() {});
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    hintText: 'Search Here',
                    iconData: Icons.search,
                    iconColor: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 05,right: 05,left: 05,bottom: 05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddMemberScreen()));
                      },
                      child: Card(
                        elevation: 5,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(.3),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.17,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: TextConst(
                              textAlign: TextAlign.center,
                              text: 'ADD MEMBER',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(.3),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.17,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: TextConst(
                            textAlign: TextAlign.center,
                            text: 'SAVE CONTACTS',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: searchController.text.isEmpty
                      ? dataMap.length
                      : searchMemberList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 05, right: 05),
                      child: Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(.3)),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MemberDetailsScreen(infoIndex: index,)));
                              },
                              dense: true,
                              contentPadding: const EdgeInsets.only(left: 10),
                              leading: const Icon(
                                Icons.account_circle_rounded,
                                size: 40,
                              ),
                              title: TextConst(
                                text: searchController.text.isEmpty
                                    ? dataMap[index].name.toString()
                                    : searchMemberList[index].name.toString(),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black,
                              ),
                              subtitle: TextConst(
                                textOverflow: TextOverflow.ellipsis,
                                text: searchController.text.isEmpty
                                    ? dataMap[index].castName.toString()
                                    : searchMemberList[index]
                                        .castName
                                        .toString(),
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Colors.grey,
                              ),
                              trailing: SizedBox(
                                width: MediaQuery.of(context).size.width / 2.72,
                                child: Row(
                                  children: [
                                    IconButtonConst(
                                      icon: Icons.call,
                                      iconSize: 21,
                                      color: Colors.black,
                                      function: () {
                                        openDialPad(
                                            '${searchController.text.isEmpty ? dataMap[index].mobileNo.toString() : searchMemberList[index].mobileNo.toString()}');
                                      },
                                    ),
                                    IconButton(
                                      onPressed: (){
                                        openWhatsApp('+91${searchController.text.isEmpty ? dataMap[index].mobileNo.toString() : searchMemberList[index].mobileNo.toString()}');
                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.whatsapp,
                                        size: 21,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButtonConst(
                                      icon: Icons.arrow_forward_ios_rounded,
                                      iconSize: 20,
                                      color: Colors.grey,
                                      function: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MemberDetailsScreen(infoIndex: index,)));
                                      },
                                    ),
                                  ],
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
            ],
          );
        },
      ),
    );
  }
}

openDialPad(String phoneNumber) async {
  Uri url = Uri(scheme: "tel", path: phoneNumber);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print("Can't open dial pad.");
  }
}

// _launchWhatsapp() async {
//   var whatsapp = "+919724286136";
//   var whatsappAndroid =
//       Uri.parse("whatsapp://send?phone=$whatsapp&text=Hello, I am my word");
//   if (await canLaunchUrl(whatsappAndroid)) {
//     await launchUrl(whatsappAndroid);
//   } else {
//     print("Whatsapp not installed");
//   }
// }

void openWhatsApp(String phone) async {
  final url = 'whatsapp://send?phone=$phone&text=Hello, You are using our *COMMUNITY APP!*';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
