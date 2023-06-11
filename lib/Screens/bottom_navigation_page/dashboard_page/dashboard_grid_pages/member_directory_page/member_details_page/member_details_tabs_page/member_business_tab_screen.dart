import 'dart:convert';

import 'package:community_app/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import '../../../../../../../components/text_const.dart';
import '../../../../../../../models/member_directory_model.dart';
import '../../../../../../../utils/app_url.dart';
import '../../../../../../../utils/font_style_const.dart';

class MemberBusinessTabScreen extends StatefulWidget {
  final int infoIndex;
  const MemberBusinessTabScreen({Key? key, required this.infoIndex}) : super(key: key);

  @override
  State<MemberBusinessTabScreen> createState() => _MemberBusinessTabScreenState();
}

class _MemberBusinessTabScreenState extends State<MemberBusinessTabScreen> {

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
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border.all(
                                color: Colors.black.withOpacity(.2),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 90,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    height: 35,
                                    child: TextConst(
                                      text: dataMap[widget.infoIndex].companyName.toString(),
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 03,
                            top: 03,
                            child: Icon(
                              Icons.star_rounded,
                              size: 20,
                              color: AppColors.appBaseColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextConst(
                        text: dataMap[widget.infoIndex].companyName.toString(),
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Icon(
                              Icons.business_center_rounded,
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
                                  text: 'Business Type',
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                                TextConst(
                                  text: dataMap[widget.infoIndex].businessType.toString(),
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
                              Icons.category,
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
                                  text: 'Category',
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                                TextConst(
                                  text: dataMap[widget.infoIndex].category.toString(),
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
                              Icons.grid_view_rounded,
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
                                  text: 'Sub Category',
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                                Flexible(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 1.30,
                                    child: TextConst(
                                      text: dataMap[widget.infoIndex].subCategory.toString(),
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
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
                              Icons.home_repair_service,
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
                                  text: 'Product/Service',
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                                Flexible(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 1.30,
                                    child: TextConst(
                                      text: dataMap[widget.infoIndex].product.toString(),
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
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
                              Icons.hexagon_rounded,
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
                                  text: 'Formation',
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                                TextConst(
                                  text: dataMap[widget.infoIndex].formation.toString(),
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
                                  text: 'Establishment',
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                                TextConst(
                                  text: dataMap[widget.infoIndex].establishment.toString(),
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
                              Icons.email_rounded,
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
                                  text: 'Email Address',
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                                TextConst(
                                  text: dataMap[widget.infoIndex].emialAddress.toString(),
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
                                    width: MediaQuery.of(context).size.width / 1.30,
                                    child: TextConst(
                                      text: dataMap[widget.infoIndex].businessAddress.toString(),
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
            ),
          );
        }
      ),
    );
  }
}
