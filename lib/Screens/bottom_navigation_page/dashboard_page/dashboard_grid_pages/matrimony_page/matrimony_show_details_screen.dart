import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';
import '../../../../../components/text_field_const.dart';
import '../../../../../models/matrimony_personal_details_model.dart';
import '../../../../../utils/app_url.dart';
import '../../../../../utils/color_const.dart';
import 'matrimony_details_screen.dart';

class MatrimonyShowDetailsScreen extends StatefulWidget {

  const MatrimonyShowDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MatrimonyShowDetailsScreen> createState() => _MatrimonyShowDetailsScreenState();
}

class _MatrimonyShowDetailsScreenState extends State<MatrimonyShowDetailsScreen> {

  TextEditingController searchController = TextEditingController();

  List<MatrimonyPersonalData> searchMatrimonyMemberList = [];

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Matrimony List',
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
      body: StreamBuilder<List<MatrimonyPersonalData>>(
        stream: getStreamBehaviour,
        builder: (context, AsyncSnapshot<List<MatrimonyPersonalData>> snapshot) {
          if(!snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 05),
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: TextFieldConst(
                      controller: searchController,
                      readOnly: false,
                      filled: false,
                      onTap: () {},
                      textAlignVertical: TextAlignVertical.bottom,
                      hintText: 'Search Here',
                      iconData: Icons.search,
                      iconColor: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 09,
                    itemBuilder: (BuildContext context, int index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.black26,
                        highlightColor: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 05, left: 10, right: 10),
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
                                  dense: true,
                                  title: Padding(
                                    padding: const EdgeInsets.only(right: 120.0),
                                    child: Container(
                                      height: 10,
                                      width: 79,
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(right: 60.0),
                                    child: Container(
                                      height: 08,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                  ),
                                  leading: Container(
                                    height: 40,
                                    width: 40,
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
              ],
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
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 05),
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black.withOpacity(.2),
                      width: 1,
                    ),
                  ),
                  child: TextFieldConst(
                    readOnly: false,
                    filled: false,
                    onTap: () {},
                    onChanged: (val) {
                      searchMatrimonyMemberList = dataMap.where((element) {
                        return element.fullName!
                            .toLowerCase()
                            .contains(val.toLowerCase());
                      }).toList();
                      setState(() {});
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    hintText: 'Search Here',
                    iconData: Icons.search,
                    iconColor: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: dataMap.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black.withOpacity(.3)),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MatrimonyDetailsScreen(infoIndex: index,)));
                              },
                              dense: false,
                              contentPadding: const EdgeInsets.only(
                                  left: 10, right: 05,top: 05,bottom: 05),
                              leading: const Icon(
                                Icons.account_circle_rounded,
                                size: 50,
                              ),
                              title: TextConst(
                                text: dataMap[index].fullName.toString(),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextConst(
                                    text: dataMap[index].castName.toString(),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                  TextConst(
                                    text: dataMap[index].occupation.toString(),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: 'Poppins',
                                    color: Colors.grey,
                                  ),
                                  // TextConst(
                                  //   text: dataMap[index].age.toString() + " Yrs " + dataMap[index].height.toString() + " ft",
                                  //   fontSize: 11,
                                  //   fontWeight: FontWeight.w100,
                                  //   fontFamily: 'Poppins',
                                  //   color: Colors.grey,
                                  // ),
                                ],
                              ),
                              trailing: SizedBox(
                                width: MediaQuery.of(context).size.width / 6.50,
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.favorite_border_rounded,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.more_vert_rounded,
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
              ),
            ],
          );
        },
      ),
    );
  }
}
