import 'dart:convert';

import 'package:community_app/components/matrimony_details_const.dart';
import 'package:community_app/components/text_const.dart';
import 'package:community_app/models/matrimony_personal_details_model.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

import '../../../../../../utils/app_url.dart';

class PersonalTabScreen extends StatefulWidget {
  final int infoIndex;
  const PersonalTabScreen({Key? key, required this.infoIndex}) : super(key: key);

  @override
  State<PersonalTabScreen> createState() => _PersonalTabScreenState();
}

class _PersonalTabScreenState extends State<PersonalTabScreen> {

  int index = 0;

  final BehaviorSubject<List<MatrimonyPersonalData>> _streamBehaviour =
  BehaviorSubject<List<MatrimonyPersonalData>>();

  Stream<List<MatrimonyPersonalData>> get getStreamBehaviour => _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final MatrimonyPersonalDetailsModel? matrimonyPersonalDetailsModel = await getMemberApi();
    _streamBehaviour.sink.add(matrimonyPersonalDetailsModel!.matrimonyPersonalData!);
  }

  Future<MatrimonyPersonalDetailsModel?> getMemberApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.matrimonyPersonalDetailsApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return MatrimonyPersonalDetailsModel.fromJson(jsonD);
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<MatrimonyPersonalData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<MatrimonyPersonalData>> snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.appBaseColor,
              ),
            );
          }
          var dataMap = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black.withOpacity(.2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius : 40,
                            backgroundColor: AppColors.appShadowColor,
                            child: Image.asset(
                              AssetImageConst.matrimony,
                              width: 55,
                              height: 55,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          VerticalDivider(
                            width: 25,
                            thickness: 1,
                            indent: 05,
                            endIndent: 05,
                            color: Colors.black.withOpacity(.2),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.60,
                            height: MediaQuery.of(context).size.height / 8.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black.withOpacity(.2),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextConst(
                                    text: dataMap[widget.infoIndex].fullName.toString(),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    letterSpacing: 1,
                                  ),
                                  TextConst(
                                    text: dataMap[widget.infoIndex].castName.toString(),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: 'Poppins',
                                    color: Colors.grey,
                                    letterSpacing: 1,
                                  ),
                                  TextConst(
                                    text: dataMap[widget.infoIndex].age.toString() + "Yrs" + " | " + dataMap[widget.infoIndex].gender.toString(),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: 'Poppins',
                                    color: Colors.grey,
                                    letterSpacing: 1,
                                  ),
                                  TextConst(
                                    text: dataMap[widget.infoIndex].occupation.toString(),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: 'Poppins',
                                    color: Colors.grey,
                                    letterSpacing: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.490,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black.withOpacity(.2),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextConst(
                                textAlign: TextAlign.center,
                                text: 'PERSONAL INFORMATION',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                letterSpacing: 1.5,
                              ),
                              Divider(
                                color: Colors.black.withOpacity(.2),
                                height: 20,
                                thickness: 1,
                              ),
                              MatrimonyDetailsConst(
                                width: MediaQuery.of(context).size.width,
                                height: 65,
                                title: 'DATE OF BIRTH',
                                subtitle: dataMap[widget.infoIndex].dob.toString(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MatrimonyDetailsConst(
                                      width: MediaQuery.of(context).size.width / 2.46,
                                      height: 65,
                                      title: 'HEIGHT',
                                      subtitle: dataMap[widget.infoIndex].height.toString(),
                                    ),
                                    MatrimonyDetailsConst(
                                      width: MediaQuery.of(context).size.width / 2.46,
                                      height: 65,
                                      title: 'WEIGHT',
                                      subtitle: dataMap[widget.infoIndex].weight.toString() + " KGS",
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MatrimonyDetailsConst(
                                      width: MediaQuery.of(context).size.width / 2.46,
                                      height: 65,
                                      title: 'BIRTH PLACE',
                                      subtitle: dataMap[widget.infoIndex].birthPlace!.toUpperCase().toString(),
                                    ),
                                    MatrimonyDetailsConst(
                                      width: MediaQuery.of(context).size.width / 2.46,
                                      height: 65,
                                      title: 'MO. NO.',
                                      subtitle: dataMap[widget.infoIndex].mobileNo.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: MatrimonyDetailsConst(
                                  width: MediaQuery.of(context).size.width,
                                  height: 65,
                                  title: 'EMAIL',
                                  subtitle: dataMap[widget.infoIndex].email!.toUpperCase().toString(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: MatrimonyDetailsConst(
                                  width: MediaQuery.of(context).size.width,
                                  height: 105,
                                  title: 'ADDRESS',
                                  subtitle: dataMap[widget.infoIndex].address!.toUpperCase().toString(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: MatrimonyDetailsConst(
                                  width: MediaQuery.of(context).size.width,
                                  height: 85,
                                  title: 'INTREST',
                                  subtitle: dataMap[widget.infoIndex].intrest!.toUpperCase().toString(),
                                ),
                              ),
                            ],
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
      )
    );
  }
}