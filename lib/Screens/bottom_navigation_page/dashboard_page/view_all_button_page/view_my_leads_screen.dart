import 'dart:convert';

import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import '../../../../components/app_bar_const.dart';
import '../../../../components/text_const.dart';
import '../../../../models/my_lead_model.dart';
import '../../../../utils/app_url.dart';
import 'add_ask_page/add_ask_screen.dart';

class ViewMyLeadsScreen extends StatefulWidget {
  const ViewMyLeadsScreen({Key? key}) : super(key: key);

  @override
  State<ViewMyLeadsScreen> createState() => _ViewMyLeadsScreenState();
}

class _ViewMyLeadsScreenState extends State<ViewMyLeadsScreen> {
  final BehaviorSubject<List<MyLeadData>> _streamBehaviour =
      BehaviorSubject<List<MyLeadData>>();

  Stream<List<MyLeadData>> get getStreamBehaviour => _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final MyLeadModel? myLeadModel = await getMyLeadApi();
    _streamBehaviour.sink.add(myLeadModel!.myLeadData!);
  }

  Future<MyLeadModel?> getMyLeadApi() async {
    var request = http.MultipartRequest('GET', Uri.parse(AppUrl.myLeadApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return MyLeadModel.fromJson(jsonD);
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 40,
        child: FittedBox(
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddAskScreen()));
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 23,
            ),
            label: TextConst(
              text: 'Add Ask',
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            elevation: 0,
            backgroundColor: AppColors.appBaseColor,
          ),
        ),
      ),
      body: StreamBuilder<List<MyLeadData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<MyLeadData>> snapshot) {
          if (!snapshot.hasData) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemExtent: 170,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
                    child: Shimmer.fromColors(
                      baseColor: Colors.black26,
                      highlightColor: Colors.black12,
                      child: Container(
                        // width: MediaQuery.of(context).size.width / 1.10,
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
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'NO DATA FOUND!',
              ),
            );
          }
          var dataMap = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.only(
                top: 10, right: 10, left: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemExtent: 170,
                shrinkWrap: true,
                itemCount: dataMap.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.black.withOpacity(.2)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 10,left: 15,right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade50,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          AssetImageConst.leadImage,
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.high,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextConst(
                                          text: "#" + dataMap[index].leadId.toString(),
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.appBaseColor,
                                        ),
                                        SizedBox(
                                          height: 03,
                                        ),
                                        TextConst(
                                          text: dataMap[index].leadDate.toString(),
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        TextConst(
                                          text: dataMap[index].leadTitle.toString(),
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                        TextConst(
                                          text: dataMap[index].leadCategory.toString(),
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Colors.black,
                                      backgroundImage: AssetImage(AssetImageConst.profile),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextConst(
                                      text: dataMap[index].leadMemberName.toString(),
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 35,
                                  width: 95,
                                  child: ElevatedButton(
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      elevation: 0,
                                      backgroundColor: AppColors.appShadowColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          side: BorderSide.none
                                      ),
                                    ),
                                    child: TextConst(
                                      text: dataMap[index].leadButtonType.toString().toUpperCase(),
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
