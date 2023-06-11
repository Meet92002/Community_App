import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import '../../../../../../../components/text_const.dart';
import '../../../../../../../models/company_services_model.dart';
import '../../../../../../../utils/app_url.dart';
import '../../../../../../../utils/image_const.dart';

class FreelanceServicesScreen extends StatefulWidget {
  const FreelanceServicesScreen({Key? key}) : super(key: key);

  @override
  State<FreelanceServicesScreen> createState() => _FreelanceServicesScreenState();
}

class _FreelanceServicesScreenState extends State<FreelanceServicesScreen> {

  List<String> jobsName = [
    "Logo Design",
    "UI/UX",
    "App Developer",
    "Web Developer",
    "Desktop Developer"
  ];

  List<String> jobImages = [
    AssetImageConst.logoDesign,
    AssetImageConst.uiux,
    AssetImageConst.appDevelop,
    AssetImageConst.webDevelop,
    AssetImageConst.desktopDevelop
  ];

  final BehaviorSubject<List<CompanyServiceData>> _streamBehaviour =
  BehaviorSubject<List<CompanyServiceData>>();

  Stream<List<CompanyServiceData>> get getStreamBehaviour =>
      _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final CompanyServicesModel? companyServicesModel =
    await getCompanyServiceApi();
    _streamBehaviour.sink.add(companyServicesModel!.companyServiceData!);
  }

  Future<CompanyServicesModel?> getCompanyServiceApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.companyServiceApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return CompanyServicesModel.fromJson(jsonD);
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CompanyServiceData>>(
      stream: getStreamBehaviour,
      builder: (context, AsyncSnapshot<List<CompanyServiceData>> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 5.635,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Shimmer.fromColors(
                    baseColor: Colors.black26,
                    highlightColor: Colors.black12,
                    child: Container(
                      width: 150,
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
          height: MediaQuery.of(context).size.height / 5.635,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: jobsName.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(09),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0, 0.6],
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(09),
                          child: Image.asset(
                            jobImages[index],
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 125,
                        left: 10,
                        child: TextConst(
                          text: dataMap[index]
                              .serviceName
                              .toString(),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
