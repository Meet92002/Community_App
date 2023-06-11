import 'dart:convert';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_show_details_screen.dart';
import 'package:community_app/models/matrimony_other_member_details_post_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../../../../../../components/all_button_const.dart';
import '../../../../../../../components/text_const.dart';
import '../../../../../../../components/text_field_const.dart';
import '../../../../../../../utils/app_url.dart';
import '../../../../../../../utils/color_const.dart';
import '../../../../../../../utils/image_const.dart';

class OtherDetailsFormScreen extends StatefulWidget {
  const OtherDetailsFormScreen({Key? key}) : super(key: key);

  @override
  State<OtherDetailsFormScreen> createState() => _OtherDetailsFormScreenState();
}

class _OtherDetailsFormScreenState extends State<OtherDetailsFormScreen> {

  TextEditingController schoolStudies = TextEditingController();
  TextEditingController schoolYear = TextEditingController();
  TextEditingController collegeStudies = TextEditingController();
  TextEditingController collegeYear = TextEditingController();
  TextEditingController masterStudies = TextEditingController();
  TextEditingController masterYear = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController presentPost = TextEditingController();
  TextEditingController experiance = TextEditingController();

  int selectTextField = -1;

  Future<MatrimonyOtherMemberDetailsPostModel?> addNewMatrimonyMemberOtherDetails(
      String schoolStudies, String schoolYear, collegeStudies, collegeYear, masterStudies, masterYear, companyName, presentPost, experiance) async {
    try {
      String url = AppUrl.baseUrl + AppUrl.matrimonyOtherMemberDetailsPostApi;
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode({
        "schoolStudies": "$schoolStudies",
        "schoolYear": "$schoolYear",
        "collegeStudies": "$collegeStudies",
        "collegeYear": "$collegeYear",
        "masterStudies": "$masterStudies",
        "masterYear": "$masterYear",
        "companyName": "$companyName",
        "presentPost": "$presentPost",
        "experiance": "$experiance"
      });
      print("data pass : ${request.body}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("Response: ${response.statusCode}");
        var jsonD = jsonDecode(await response.stream.bytesToString());
        return MatrimonyOtherMemberDetailsPostModel.fromJson(jsonD);
      } else {
        print("Error");
      }
    } catch (e) {
      print("Error: " + e.toString());
    }
    return null;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MatrimonyShowDetailsScreen()));
        });
        return AlertDialog(
          icon: Image.asset(
            height: 80,
            width: 80,
            filterQuality: FilterQuality.high,
            AssetImageConst.submitted,
          ),
          title: TextConst(
            text: 'New Member Other Data Added!',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Poppins',
            color: AppColors.appBaseColor,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 05,left: 10,right: 10,bottom: 05),
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
            padding: const EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TextConst(
                    text: 'EDUCATION DETAILS FORM',
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    letterSpacing: 4.0,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(.3),
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectTextField == 0
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      controller: schoolStudies,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 0;
                        });
                      },
                      hintText: 'School Studies',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectTextField == 1
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      keyBoardType: TextInputType.number,
                      controller: schoolYear,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 1;
                        });
                      },
                      hintText: 'School Year',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectTextField == 2
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      controller: collegeStudies,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 2;
                        });
                      },
                      hintText: 'College Studies',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectTextField == 3
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      keyBoardType: TextInputType.number,
                      controller: collegeYear,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 3;
                        });
                      },
                      hintText: 'College Year',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectTextField == 4
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      controller: masterStudies,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 4;
                        });
                      },
                      hintText: 'Master Studies',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectTextField == 5
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      keyBoardType: TextInputType.number,
                      controller: masterYear,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 5;
                        });
                      },
                      hintText: 'Master Year',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(.1),
                    height: 15,
                  ),
                  TextConst(
                    text: 'EMPLOYEE DETAILS FORM',
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    letterSpacing: 4.0,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(.3),
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectTextField == 6
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      controller: companyName,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 6;
                        });
                      },
                      hintText: 'Company Name',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectTextField == 7
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      controller: presentPost,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 7;
                        });
                      },
                      hintText: 'Present Post',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectTextField == 8
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      keyBoardType: TextInputType.number,
                      controller: experiance,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 8;
                        });
                      },
                      hintText: 'Experiance (In Year)',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AllButtonConst(
                    onPressed: () {
                      if(schoolStudies.text.isNotEmpty && schoolYear.text.isNotEmpty && collegeStudies.text.isNotEmpty && collegeYear.text.isNotEmpty && masterStudies.text.isNotEmpty && masterYear.text.isNotEmpty && companyName.text.isNotEmpty && presentPost.text.isNotEmpty && experiance.text.isNotEmpty) {
                        addNewMatrimonyMemberOtherDetails(
                          schoolStudies.text.toString(),
                          schoolYear.text,
                          collegeStudies.text.toString(),
                          collegeYear.text,
                          masterStudies.text.toString(),
                          masterYear.text,
                          companyName.text.toString(),
                          presentPost.text.toString(),
                          experiance.text,
                        );
                        _showMyDialog();
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Required All Form Fields',
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: AppColors.appBaseColor,
                          textColor: Colors.black,
                        );
                      }
                    },
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    text: 'SUBMIT',
                    elevation: 0,
                    color: AppColors.appBaseColor,
                    fontSize: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
