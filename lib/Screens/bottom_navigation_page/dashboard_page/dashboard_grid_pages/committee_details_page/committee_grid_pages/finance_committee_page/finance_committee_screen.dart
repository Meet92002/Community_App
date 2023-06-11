import 'dart:convert';
import 'package:community_app/models/finance_committee_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../../components/app_bar_const.dart';
import '../../../../../../../components/icon_button_const.dart';
import '../../../../../../../components/text_const.dart';
import '../../../../../../../components/text_field_const.dart';
import '../../../../../../../utils/app_url.dart';

class FinanceCommitteeScreen extends StatefulWidget {
  const FinanceCommitteeScreen({Key? key}) : super(key: key);

  @override
  State<FinanceCommitteeScreen> createState() => _FinanceCommitteeScreenState();
}

class _FinanceCommitteeScreenState extends State<FinanceCommitteeScreen> {

  TextEditingController searchController = TextEditingController();

  List<FinanceData> searchFinanceMemberList = [];
  final BehaviorSubject<List<FinanceData>> _streamBehaviour =
  BehaviorSubject<List<FinanceData>>();

  Stream<List<FinanceData>> get getStreamBehaviour => _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final FinanceCommitteeModel? financeCommitteeModel = await getMemberApi();
    _streamBehaviour.sink.add(financeCommitteeModel!.financeData!);
  }

  Future<FinanceCommitteeModel?> getMemberApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.financeCommitteeApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return FinanceCommitteeModel.fromJson(jsonD);
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
          text: 'Finance Committee',
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
      body: StreamBuilder<List<FinanceData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<FinanceData>> snapshot) {
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
                      readOnly: false,
                      filled: false,
                      onTap: () {},
                      textAlignVertical: TextAlignVertical.bottom,
                      hintText: 'Search Here',
                      iconData: Icons.search,
                      iconColor: Colors.grey,
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
                      searchFinanceMemberList = dataMap.where((element) {
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
              Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: searchController.text.isEmpty
                      ? dataMap.length
                      : searchFinanceMemberList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                      const EdgeInsets.only(top: 05, left: 05, right: 05),
                      child: Card(
                        elevation: 5,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          BorderSide(color: Colors.black.withOpacity(.3)),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {},
                              dense: true,
                              contentPadding: const EdgeInsets.only(left: 10),
                              leading: const Icon(
                                Icons.account_circle_rounded,
                                size: 40,
                              ),
                              title: TextConst(
                                text: searchController.text.isEmpty
                                    ? dataMap[index].name.toString()
                                    : searchFinanceMemberList[index].name.toString(),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black,
                              ),
                              subtitle: TextConst(
                                text: searchController.text.isEmpty
                                    ? dataMap[index].subTitle.toString()
                                    : searchFinanceMemberList[index]
                                    .subTitle.toString(),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w100,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              trailing: SizedBox(
                                width: MediaQuery.of(context).size.width / 3.70,
                                child: Row(
                                  children: [
                                    IconButtonConst(
                                      icon: Icons.call,
                                      iconSize: 21,
                                      color: Colors.black,
                                      function: () {
                                        openDialPad('${searchController.text.isEmpty ? dataMap[index].mobileNo.toString() : searchFinanceMemberList[index].mobileNo.toString()}');
                                      },
                                    ),
                                    IconButton(
                                      onPressed: (){
                                        openWhatsApp('+91${searchController.text.isEmpty ? dataMap[index].mobileNo.toString() : searchFinanceMemberList[index].mobileNo.toString()}');
                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.whatsapp,
                                        size: 21,
                                        color: Colors.black,
                                      ),
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

void openWhatsApp(String phone) async {
  final url = 'whatsapp://send?phone=$phone&text=Hello, Now you are meet our *FINANCE COMMITTEE!*';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

