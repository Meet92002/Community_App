import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import '../../../../../../components/matrimony_details_const.dart';
import '../../../../../../components/text_const.dart';
import '../../../../../../models/matrimony_other_details_model.dart';
import '../../../../../../utils/app_url.dart';
import '../../../../../../utils/color_const.dart';

class OtherTabScreen extends StatefulWidget {
  final int infoIndex;
  const OtherTabScreen({Key? key, required this.infoIndex}) : super(key: key);

  @override
  State<OtherTabScreen> createState() => _OtherTabScreenState();
}

class _OtherTabScreenState extends State<OtherTabScreen> {

  final BehaviorSubject<List<MatrimonyOtherData>> _streamBehaviour =
  BehaviorSubject<List<MatrimonyOtherData>>();

  Stream<List<MatrimonyOtherData>> get getStreamBehaviour => _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final MatrimonyOtherDetailsModel? matrimonyOtherDetailsModel = await getMemberApi();
    _streamBehaviour.sink.add(matrimonyOtherDetailsModel!.matrimonyOtherData!);
  }

  Future<MatrimonyOtherDetailsModel?> getMemberApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.matrimonyOtherMemberDetailsApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return MatrimonyOtherDetailsModel.fromJson(jsonD);
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<MatrimonyOtherData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<MatrimonyOtherData>> snapshot) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextConst(
                      textAlign: TextAlign.center,
                      text: 'EDUCATION INFORMATION',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MatrimonyDetailsConst(
                          width: MediaQuery.of(context).size.width / 2.31,
                          height: 65,
                          title: 'SCHOOL STUDIES',
                          subtitle: dataMap[widget.infoIndex].schoolStudies!.toUpperCase().toString(),
                        ),
                        MatrimonyDetailsConst(
                          width: MediaQuery.of(context).size.width / 2.31,
                          height: 65,
                          title: 'COMPLETE YEAR',
                          subtitle: dataMap[widget.infoIndex].schoolYear.toString(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MatrimonyDetailsConst(
                            width: MediaQuery.of(context).size.width / 2.31,
                            height: 65,
                            title: 'COLLEGE STUDIES',
                            subtitle: dataMap[widget.infoIndex].collegeStudies!.toUpperCase().toString(),
                          ),
                          MatrimonyDetailsConst(
                            width: MediaQuery.of(context).size.width / 2.31,
                            height: 65,
                            title: 'COMPLETE YEAR',
                            subtitle: dataMap[widget.infoIndex].collegeYear.toString(),
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
                            width: MediaQuery.of(context).size.width / 2.31,
                            height: 65,
                            title: 'MASTER STUDIES',
                            subtitle: dataMap[widget.infoIndex].masterStudies!.toUpperCase().toString(),
                          ),
                          MatrimonyDetailsConst(
                            width: MediaQuery.of(context).size.width / 2.31,
                            height: 65,
                            title: 'COMPLETE YEAR',
                            subtitle: dataMap[widget.infoIndex].masterYear.toString(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black.withOpacity(.1),
                      height: 25,
                      thickness: 1,
                    ),
                    TextConst(
                      textAlign: TextAlign.center,
                      text: 'EMPLOYEE INFORMATION',
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
                      title: 'COMPANY NAME',
                      subtitle: dataMap[widget.infoIndex].companyName!.toUpperCase().toString(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MatrimonyDetailsConst(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        title: 'PRESENT POST',
                        subtitle: dataMap[widget.infoIndex].presentPost!.toUpperCase().toString(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MatrimonyDetailsConst(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        title: 'EXPERIENCE',
                        subtitle: dataMap[widget.infoIndex].experiance.toString(),
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
  }
}
