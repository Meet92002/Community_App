import 'dart:convert';

import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/documents_page/documents_pdf_list_screen.dart';
import 'package:community_app/models/pdf_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../utils/app_url.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {

  // List<String> documentsPdf = [
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
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'Documents',
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
      body: StreamBuilder<List<PdfData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<PdfData>> snapshot) {
          if (!snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 07,right: 05,left: 05),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
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

          return Padding(
            padding: const EdgeInsets.only(top: 05,left: 05,right: 05,bottom: 05),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dataMap.length,
                itemBuilder: (BuildContext context, int index) {
                  return DocumentsPdfListScreen(
                    pdfName: dataMap[index].pdfName.toString(),
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
