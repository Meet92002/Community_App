import 'dart:convert';

import 'package:community_app/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import '../../../../../../../components/text_const.dart';
import '../../../../../../../models/member_directory_model.dart';
import '../../../../../../../utils/app_url.dart';

class MemberPersonalTabScreen extends StatefulWidget {
  final int infoIndex;
  const MemberPersonalTabScreen({Key? key, required this.infoIndex}) : super(key: key);

  @override
  State<MemberPersonalTabScreen> createState() => _MemberPersonalTabScreenState();
}

class _MemberPersonalTabScreenState extends State<MemberPersonalTabScreen> {

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
      body: StreamBuilder<List<MemberData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<MemberData>> snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
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
          return Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 20,right: 15,bottom: 10),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Icon(
                            Icons.call,
                            size: 25,
                            color: Colors.grey,
                          ),
                          VerticalDivider(
                            color: Colors.black.withOpacity(.2),
                            width: 20,
                            indent: 03,
                            endIndent: 03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextConst(
                                text: 'Mobile Number',
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                              TextConst(
                                text: dataMap[widget.infoIndex].mobileNo.toString(),
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 25,
                            color: Colors.grey,
                          ),
                          VerticalDivider(
                            color: Colors.black.withOpacity(.2),
                            width: 20,
                            indent: 03,
                            endIndent: 03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextConst(
                                text: 'Date Of Birth',
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                              TextConst(
                                text: dataMap[widget.infoIndex].dob.toString(),
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 25,
                            color: Colors.grey,
                          ),
                          VerticalDivider(
                            color: Colors.black.withOpacity(.2),
                            width: 20,
                            indent: 03,
                            endIndent: 03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextConst(
                                text: 'Marriage Anniversary',
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                              TextConst(
                                text: dataMap[widget.infoIndex].marriageAnniversary.toString(),
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 25,
                                color: Colors.grey,
                              ),
                              VerticalDivider(
                                color: Colors.black.withOpacity(.2),
                                width: 20,
                                indent: 03,
                                endIndent: 03,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextConst(
                                    text: 'Emergency Contact',
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                  TextConst(
                                    text: dataMap[widget.infoIndex].emergancyContact.toString(),
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.call,
                            size: 25,
                            color: AppColors.appBaseColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 25,
                            color: Colors.grey,
                          ),
                          VerticalDivider(
                            color: Colors.black.withOpacity(.2),
                            width: 20,
                            indent: 03,
                            endIndent: 03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextConst(
                                text: 'Address',
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                              Flexible(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 1.32,
                                  child: TextConst(
                                    text: dataMap[widget.infoIndex].address.toString(),
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 05,
                              ),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 40,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextConst(
                                        text: 'Get Direction',
                                        fontSize: 14,
                                        color: AppColors.appBaseColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                      SizedBox(
                                        width: 05,
                                      ),
                                      Icon(
                                        Icons.directions_rounded,
                                        size: 20,
                                        color: AppColors.appBaseColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
