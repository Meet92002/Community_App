import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:community_app/models/matrimony_family_member_details_post_model.dart';
import 'package:flutter/material.dart';
import '../../../../../../../components/all_button_const.dart';
import '../../../../../../../components/text_const.dart';
import '../../../../../../../components/text_field_const.dart';
import '../../../../../../../utils/app_url.dart';
import '../../../../../../../utils/color_const.dart';
import '../../../../../../../utils/image_const.dart';
import '../matrimony_add_details_screen.dart';

class FamilyDetailsFormScreen extends StatefulWidget {
  const FamilyDetailsFormScreen({Key? key}) : super(key: key);

  @override
  State<FamilyDetailsFormScreen> createState() => _FamilyDetailsFormScreenState();
}

class _FamilyDetailsFormScreenState extends State<FamilyDetailsFormScreen> {

  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController fatherBusiness = TextEditingController();
  TextEditingController fatherMobileNumber = TextEditingController();
  TextEditingController elderSister = TextEditingController();
  TextEditingController elderBrother = TextEditingController();
  TextEditingController maternal = TextEditingController();
  TextEditingController nativePlace = TextEditingController();

  int selectTextField = -1;

  Future<MatrimonyFamilyMemberDetailsPostModel?> addNewMatrimonyMemberFamilyDetails(
      String fatherName, String motherName, fatherBusiness, fatherMobileNo, elderSister, elderBrother, maternal, nativePlace) async {
    try {
      String url = AppUrl.baseUrl + AppUrl.matrimonyFamilyMemberDetailsPostApi;
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode({
        "fatherName": "$fatherName",
        "motherName": "$motherName",
        "fatherBusiness": "$fatherBusiness",
        "fatherMobileNo": "$fatherMobileNo",
        "elderSister": "$elderSister",
        "elderBrother": "$elderBrother",
        "maternal": "$maternal",
        "nativePlace": "$nativePlace",
      });
      print("data pass : ${request.body}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("Response: ${response.statusCode}");
        var jsonD = jsonDecode(await response.stream.bytesToString());
        return MatrimonyFamilyMemberDetailsPostModel.fromJson(jsonD);
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MatrimonyAddDetailsScreen(initialindex: 3)));
        });
        return AlertDialog(
          icon: Image.asset(
            height: 80,
            width: 80,
            filterQuality: FilterQuality.high,
            AssetImageConst.submitted,
          ),
          title: TextConst(
            text: 'New Member Family Data Added!',
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
                    text: 'FAMILY DETAILS FORM',
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
                      controller: fatherName,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 0;
                        });
                      },
                      hintText: 'Father Name',
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
                      controller: motherName,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 1;
                        });
                      },
                      hintText: 'Mother Name',
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
                      controller: fatherBusiness,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 2;
                        });
                      },
                      hintText: 'Father Business',
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
                      keyBoardType: TextInputType.phone,
                      controller: fatherMobileNumber,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 3;
                        });
                      },
                      hintText: 'Father Mobile No.',
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
                      controller: elderSister,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 4;
                        });
                      },
                      hintText: 'Elder Sister Name',
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
                      controller: elderBrother,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 5;
                        });
                      },
                      hintText: 'Elder Brother Name',
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
                        color: selectTextField == 6
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      controller: maternal,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 6;
                        });
                      },
                      hintText: 'Maternal',
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
                      controller: nativePlace,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 7;
                        });
                      },
                      hintText: 'Native Place',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AllButtonConst(
                    onPressed: () {
                      if(fatherName.text.isNotEmpty && motherName.text.isNotEmpty && fatherBusiness.text.isNotEmpty && fatherMobileNumber.text.isNotEmpty && elderSister.text.isNotEmpty && elderBrother.text.isNotEmpty && maternal.text.isNotEmpty && nativePlace.text.isNotEmpty) {
                        addNewMatrimonyMemberFamilyDetails(
                          fatherName.text.toString(),
                          motherName.text.toString(),
                          fatherBusiness.text.toString(),
                          fatherMobileNumber.text,
                          elderSister.text.toString(),
                          elderBrother.text.toString(),
                          maternal.text.toString(),
                          nativePlace.text.toString(),
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
