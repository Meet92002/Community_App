import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:community_app/models/my_lead_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shimmer/shimmer.dart';
import '../../../components/text_const.dart';
import '../../../utils/app_url.dart';
import '../../../utils/color_const.dart';
import '../../../utils/image_const.dart';

class MyLeadsScreen extends StatefulWidget {
  const MyLeadsScreen({Key? key}) : super(key: key);

  @override
  State<MyLeadsScreen> createState() => _MyLeadsScreenState();
}

class _MyLeadsScreenState extends State<MyLeadsScreen> {
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
    return StreamBuilder<List<MyLeadData>>(
      stream: getStreamBehaviour,
      builder: (context, AsyncSnapshot<List<MyLeadData>> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 5.38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 295,
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
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
        return SizedBox(
          height: MediaQuery.of(context).size.height / 5.38,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemExtent: 295,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, right: 10, left: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextConst(
                              text: dataMap[index].leadDate.toString(),
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                            Container(
                              height: 27,
                              width: 72,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(05),
                                    side: BorderSide.none,
                                  ),
                                  backgroundColor: AppColors.appShadowColor,
                                ),
                                child: TextConst(
                                  text: dataMap[index].leadButtonType.toString().toUpperCase(),
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage(AssetImageConst.profile),
                                backgroundColor: Colors.black,
                              ),
                              VerticalDivider(
                                color: Colors.black.withOpacity(.2),
                                indent: 05,
                                endIndent: 05,
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextConst(
                                    text: dataMap[index].leadTitle.toString(),
                                    fontSize: 11,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                  TextConst(
                                    text: dataMap[index].leadSubtitle.toString(),
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black.withOpacity(.2),
                          height: 12,
                        ),
                        TextConst(
                          text: dataMap[index].leadCategory.toString(),
                          fontSize: 11,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                        TextConst(
                          text: dataMap[index].leadDescription.toString(),
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                        Row(
                          children: [
                            TextConst(
                              text: "Member's need: ",
                              fontSize: 11,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            TextConst(
                              text: dataMap[index].memberNeed.toString(),
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
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
        );
      },
    );
  }
}
