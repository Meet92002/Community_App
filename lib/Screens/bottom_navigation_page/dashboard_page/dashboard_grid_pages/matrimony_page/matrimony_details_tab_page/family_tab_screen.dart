import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import '../../../../../../components/matrimony_details_const.dart';
import '../../../../../../components/text_const.dart';
import '../../../../../../models/matrimony_family_details_model.dart';
import '../../../../../../utils/app_url.dart';
import '../../../../../../utils/color_const.dart';

class FamilyTabScreen extends StatefulWidget {
  final int infoIndex;
  const FamilyTabScreen({Key? key, required this.infoIndex}) : super(key: key);

  @override
  State<FamilyTabScreen> createState() => _FamilyTabScreenState();
}

class _FamilyTabScreenState extends State<FamilyTabScreen> {

  final BehaviorSubject<List<MatrimonyFamilyData>> _streamBehaviour =
  BehaviorSubject<List<MatrimonyFamilyData>>();

  Stream<List<MatrimonyFamilyData>> get getStreamBehaviour => _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final MatrimonyFamilyDetailsModel? matrimonyFamilyDetailsModel = await getMemberApi();
    _streamBehaviour.sink.add(matrimonyFamilyDetailsModel!.matrimonyFamilyData!);
  }

  Future<MatrimonyFamilyDetailsModel?> getMemberApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.matrimonyFamilyDetailsApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return MatrimonyFamilyDetailsModel.fromJson(jsonD);
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<MatrimonyFamilyData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<MatrimonyFamilyData>> snapshot) {
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
                      text: 'FAMILY INFORMATION',
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
                      title: 'FATHER NAME',
                      subtitle: dataMap[widget.infoIndex].fatherName!.toUpperCase().toString(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MatrimonyDetailsConst(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        title: 'MOTHER NAME',
                        subtitle: dataMap[widget.infoIndex].motherName!.toUpperCase().toString(),
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
                            title: 'FATHER BUSINESS',
                            subtitle: dataMap[widget.infoIndex].fatherBusiness!.toUpperCase().toString(),
                          ),
                          MatrimonyDetailsConst(
                            width: MediaQuery.of(context).size.width / 2.31,
                            height: 65,
                            title: 'FATHER MO. NO.',
                            subtitle: dataMap[widget.infoIndex].fatherMobileNo.toString(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MatrimonyDetailsConst(
                        width: MediaQuery.of(context).size.width,
                        height: 85,
                        title: 'ELDER SISTER',
                        subtitle: dataMap[widget.infoIndex].elderSister!.toUpperCase().toString(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MatrimonyDetailsConst(
                        width: MediaQuery.of(context).size.width,
                        height: 85,
                        title: 'ELDER BROTHER',
                        subtitle: dataMap[widget.infoIndex].elderBrother!.toUpperCase().toString(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MatrimonyDetailsConst(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        title: 'MATERNAL',
                        subtitle: dataMap[widget.infoIndex].maternal!.toUpperCase().toString(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MatrimonyDetailsConst(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        title: 'NATIVE PLACE',
                        subtitle: dataMap[widget.infoIndex].nativePlace!.toUpperCase().toString(),
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
