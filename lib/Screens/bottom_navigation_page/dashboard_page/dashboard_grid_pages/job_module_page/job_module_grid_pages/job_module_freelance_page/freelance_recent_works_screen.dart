import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../../../../../../components/text_const.dart';
import '../../../../../../../models/company_work_data_model.dart';
import '../../../../../../../utils/app_url.dart';
import '../../../../../../../utils/color_const.dart';
import '../../../../../../../utils/image_const.dart';

class FreelanceRecentWorksScreen extends StatefulWidget {
  const FreelanceRecentWorksScreen({Key? key}) : super(key: key);

  @override
  State<FreelanceRecentWorksScreen> createState() => _FreelanceRecentWorksScreenState();
}

class _FreelanceRecentWorksScreenState extends State<FreelanceRecentWorksScreen> {

  List<String> jobImages = [
    AssetImageConst.logoDesign,
    AssetImageConst.uiux,
    AssetImageConst.appDevelop,
    AssetImageConst.webDevelop,
    AssetImageConst.desktopDevelop
  ];

  bool _isLiked = false;

  final BehaviorSubject<List<CompanyWorkData>> _streamBehaviour =
  BehaviorSubject<List<CompanyWorkData>>();

  Stream<List<CompanyWorkData>> get getStreamBehaviour =>
      _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final CompanyWorkDataModel? companyWorkDataModel =
    await getCompanyWorkApi();
    _streamBehaviour.sink.add(companyWorkDataModel!.companyWorkData!);
  }

  Future<CompanyWorkDataModel?> getCompanyWorkApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.companyWorkApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return CompanyWorkDataModel.fromJson(jsonD);
    } else {
      print(response.reasonPhrase);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CompanyWorkData>>(
      stream: getStreamBehaviour,
      builder: (context, AsyncSnapshot<List<CompanyWorkData>> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 4.80,
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
                      width: MediaQuery.of(context).size.width / 1.10,
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
          height: MediaQuery.of(context).size.height / 4.80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black.withOpacity(.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: MediaQuery.of(context).size.height,
                        foregroundDecoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(09),
                            bottomLeft: Radius.circular(09),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black45,
                              Colors.transparent,
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            stops: [0, 0.6],
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(09),
                            bottomLeft: Radius.circular(09),
                          ),
                          child: Image.asset(
                            jobImages[index],
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width:
                        MediaQuery.of(context).size.width / 1.672,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(09),
                            bottomRight: Radius.circular(09),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 08, left: 08, right: 08, bottom: 05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              TextConst(
                                text:
                                dataMap[index].workTitle.toString(),
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                textOverflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 03,
                              ),
                              RichText(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: dataMap[index]
                                      .workDetails
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.black.withOpacity(.2),
                                height: 18,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(50),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: AssetImage(
                                              AssetImageConst.profile),
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 08,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          TextConst(
                                            text: dataMap[index]
                                                .workUserName
                                                .toString(),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            color: Colors.black,
                                            textOverflow:
                                            TextOverflow.ellipsis,
                                          ),
                                          TextConst(
                                            text: dataMap[index]
                                                .workUserCategory
                                                .toString(),
                                            fontWeight: FontWeight.w100,
                                            fontFamily: 'Poppins',
                                            fontSize: 09,
                                            color: Colors.grey,
                                            textOverflow:
                                            TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isLiked = !_isLiked;
                                      });
                                    },
                                    child: Icon(
                                      _isLiked == true
                                          ? Icons.favorite_rounded
                                          : Icons
                                          .favorite_border_rounded,
                                      size: 20,
                                      color: _isLiked == true
                                          ? AppColors.appBaseColor
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.black.withOpacity(.2),
                                height: 18,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  SmoothStarRating(
                                    allowHalfRating: true,
                                    starCount: 5,
                                    rating: dataMap[index]
                                        .workRating!
                                        .toDouble(),
                                    size: 20.0,
                                    color: AppColors.appBaseColor,
                                    borderColor: AppColors.appBaseColor,
                                    filledIconData: Icons.star_rounded,
                                    halfFilledIconData:
                                    Icons.star_half_rounded,
                                    defaultIconData:
                                    Icons.star_border_rounded,
                                    spacing: .5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      TextConst(
                                        text: 'Bid',
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                      TextConst(
                                        text: ' \$' +
                                            dataMap[index]
                                                .workPrice
                                                .toString(),
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ],
                                  ),
                                ],
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
        );
      },
    );
  }
}
