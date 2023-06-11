import 'dart:convert';

import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/circular_page/circular_pdf_list_screen.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';
import '../../../../../models/pdf_model.dart';
import '../../../../../utils/app_url.dart';

class CircularScreen extends StatefulWidget {
  const CircularScreen({Key? key}) : super(key: key);

  @override
  State<CircularScreen> createState() => _CircularScreenState();
}

class _CircularScreenState extends State<CircularScreen> {

  // List<String> pdf = [
  //   "Events",
  //   "Community",
  //   "Emergency_Meet",
  //   "2022",
  //   "2k23_Party",
  // ];

  final BehaviorSubject<List<PdfData>> _streamBehaviour =
  BehaviorSubject<List<PdfData>>();

  Stream<List<PdfData>> get getStreamBehaviour => _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final PdfModel? pdfModel = await getPdfApi();
    _streamBehaviour.sink.add(pdfModel!.pdfData!);
  }

  Future<PdfModel?> getPdfApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.pdfApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return PdfModel.fromJson(jsonD);
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Circular',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.3),
                ),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.555,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,right: 10,bottom: 10,left: 10),
                  child: Column(
                    children: [
                      TextConst(
                        text: "Today's News",
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      Divider(
                        color: Colors.black.withOpacity(.3),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.07,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 0,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black.withOpacity(.3),
                                ),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.43,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,right: 10,bottom: 10,left: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height * 0.19,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: const DecorationImage(
                                            image: AssetImage(AssetImageConst.news),
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.black.withOpacity(.3),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height / 5.06,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextConst(
                                              text: 'Today people make innovative',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 05,
                                            ),
                                            TextConst(
                                              text: 'Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences.“a group of sentences paragraph is defined as “a group of sentences.“a group of sentences.',
                                              textAlign: TextAlign.justify,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w100,
                                              fontFamily: 'Poppins',
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.3),
                ),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 10),
                  child: Column(
                    children: [
                      TextConst(
                        text: "Today's Circulars",
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      Divider(
                        color: Colors.black.withOpacity(.3),
                      ),
                      StreamBuilder<List<PdfData>>(
                        stream: getStreamBehaviour,
                        builder: (context, AsyncSnapshot<List<PdfData>> snapshot) {
                          if(!snapshot.hasData) {
                            return Expanded(
                              flex: 1,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 09,
                                itemBuilder: (BuildContext context, int index) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.black26,
                                    highlightColor: Colors.black12,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 07),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.black.withOpacity(.3),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              contentPadding: const EdgeInsets.only(left: 10,right: 10),
                                              dense: false,
                                              title: Padding(
                                                padding: const EdgeInsets.only(right: 60.0),
                                                child: Container(
                                                  height: 10,
                                                  width: 90,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              leading: Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: Colors.white,
                                                ),
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
                          if(snapshot.data!.isEmpty) {
                            return Center(
                              child: Text(
                                'NO DATA FOUND!',
                              ),
                            );
                          }
                          var dataMap = snapshot.data!;

                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 4.38,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: dataMap.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CircularPdfListScreen(
                                  courseName: dataMap[index].pdfName.toString(),
                                );
                              },
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
