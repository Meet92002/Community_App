import 'dart:convert';
import 'package:community_app/utils/app_url.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../components/app_bar_const.dart';
import '../../../../../../../models/test_model.dart';

class PopulerJobDetails extends StatefulWidget {
  final String? id;
  final String? text;
  const PopulerJobDetails({Key? key, this.id, this.text}) : super(key: key);

  @override
  State<PopulerJobDetails> createState() => _PopulerJobDetailsState();
}

class _PopulerJobDetailsState extends State<PopulerJobDetails> {
  Future<TestModel?> getCompunyData() async {
    print("get all compuany data call");
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(AppUrl.freelanceJobsApi));
      request.body = json.encode({"id": "${widget.id}"});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print("reponse code is  printed before : ${response.statusCode}");
      if (response.statusCode == 200) {
        print("reponse code is  200");
        var jsonD = jsonDecode(await response.stream.bytesToString());
        return TestModel.fromJson(jsonD);
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("exception throw by catch : e : $e");
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: widget.text,
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<TestModel?>(
          future: getCompunyData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.appBaseColor,
                ),
              );
            }
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, right: 08, left: 08),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 102,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black.withOpacity(.2),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10, right: 05),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            AssetImageConst.noImage,
                                            width: 40,
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '${snapshot.data!.jobProfileData!.companyName}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(09),
                            topLeft: Radius.circular(09),
                          ),
                          border: Border.all(
                            color: Colors.black.withOpacity(.1),
                          ),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(
                          child: Text(
                            '${snapshot.data!.jobProfileData!.companyType!.toUpperCase()}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
