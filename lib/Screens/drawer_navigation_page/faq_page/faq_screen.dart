import 'dart:convert';

import 'package:community_app/components/text_const.dart';
import 'package:community_app/models/faq_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import '../../../components/app_bar_const.dart';
import '../../../utils/app_url.dart';
import '../../../utils/color_const.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {

  List<bool> _isExpandedStateList =
  List<bool>.generate(9999, (int index) => false);

  final BehaviorSubject<List<FaqData>> _streamBehaviour =
  BehaviorSubject<List<FaqData>>();

  Stream<List<FaqData>> get getStreamBehaviour => _streamBehaviour.stream;

  @override
  void initState() {
    super.initState();
    getDataCall();
  }

  getDataCall() async {
    final FaqModel? faqModel = await getFaqApi();
    _streamBehaviour.sink.add(faqModel!.faqData!);
  }

  Future<FaqModel?> getFaqApi() async {
    var request =
    http.MultipartRequest('GET', Uri.parse(AppUrl.faqApi));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return FaqModel.fromJson(jsonD);
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
          text: 'Faq',
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
      body: StreamBuilder<List<FaqData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<FaqData>> snapshot) {
          if(!snapshot.hasData) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 09,
                itemBuilder: (BuildContext context, int index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.black26,
                    highlightColor: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 05, right: 05,bottom: 10),
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
                              contentPadding: const EdgeInsets.only(left: 15,right: 15),
                              dense: true,
                              title: Padding(
                                padding: const EdgeInsets.only(right: 50.0),
                                child: Container(
                                  height: 10,
                                  width: 80,
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
          return Padding(
            padding: EdgeInsets.only(top: 10,right: 05,bottom: 10,left: 05),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: dataMap.length,
              itemBuilder: (BuildContext context, int index) {
                bool _isExpanded = _isExpandedStateList[index];
                return Card(
                  elevation: 0,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(.2),
                    ),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      onExpansionChanged: (bool value){
                        setState(() {
                          _isExpandedStateList[index] = value;
                        });
                      },
                      childrenPadding: EdgeInsets.only(bottom: 10,right: 15,left: 15),
                      trailing: Icon(
                        _isExpanded ? Icons.arrow_circle_up_rounded : Icons.arrow_circle_down_rounded,
                        color: _isExpanded ? AppColors.appBaseColor : Colors.grey,
                      ),
                      title: TextConst(
                        text: dataMap[index].faqTitle.toString(),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: _isExpanded ? AppColors.appBaseColor : Colors.black,
                      ),
                      children: [
                        Divider(
                          color: Colors.black.withOpacity(.2),
                        ),
                        TextConst(
                          text: dataMap[index].faqSubtitle.toString(),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
