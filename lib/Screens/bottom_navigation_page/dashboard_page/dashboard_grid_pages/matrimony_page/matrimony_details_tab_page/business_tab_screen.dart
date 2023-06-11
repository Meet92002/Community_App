import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:community_app/models/matrimony_business_details_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../components/matrimony_details_const.dart';
import '../../../../../../components/text_const.dart';
import '../../../../../../utils/app_url.dart';
import '../../../../../../utils/color_const.dart';

class BusinessTabScreen extends StatefulWidget {
  final int infoIndex;
  const BusinessTabScreen({Key? key, required this.infoIndex}) : super(key: key);

  @override
  State<BusinessTabScreen> createState() => _BusinessTabScreenState();
}

class _BusinessTabScreenState extends State<BusinessTabScreen> {

  final BehaviorSubject<List<MatrimonyBusinessData>> _streamBehaviour =
  BehaviorSubject<List<MatrimonyBusinessData>>();

  Stream<List<MatrimonyBusinessData>> get getStreamBehaviour => _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final MatrimonyBusinessDetailsModel? matrimonyBusinessDetailsModel = await getMemberApi();
    _streamBehaviour.sink.add(matrimonyBusinessDetailsModel!.matrimonyBusinessData!);
  }

  Future<MatrimonyBusinessDetailsModel?> getMemberApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.matrimonyBusinessDetailsApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return MatrimonyBusinessDetailsModel.fromJson(jsonD);
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<MatrimonyBusinessData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<MatrimonyBusinessData>> snapshot) {
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
                      text: 'BUSINESS INFORMATION',
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
                      title: 'BUSINESS NAME',
                      subtitle: dataMap[widget.infoIndex].businessName!.toUpperCase().toString(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MatrimonyDetailsConst(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        title: 'OCCUPATION',
                        subtitle: dataMap[widget.infoIndex].occupation!.toUpperCase().toString(),
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
                            title: 'BUSINESS TYPE',
                            subtitle: dataMap[widget.infoIndex].businessType!.toUpperCase().toString(),
                          ),
                          MatrimonyDetailsConst(
                            width: MediaQuery.of(context).size.width / 2.31,
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
                        title: 'BUSINESS EMAIL',
                        subtitle: dataMap[widget.infoIndex].businessEmail!.toUpperCase().toString(),
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
