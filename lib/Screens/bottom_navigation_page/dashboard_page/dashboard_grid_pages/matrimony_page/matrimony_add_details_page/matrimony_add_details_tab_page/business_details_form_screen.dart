import 'dart:convert';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_add_details_page/matrimony_add_details_tab_page/family_details_form_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_show_details_screen.dart';
import 'package:community_app/models/matrimony_business_memeber_details_post_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../../components/all_button_const.dart';
import '../../../../../../../components/text_const.dart';
import '../../../../../../../components/text_field_const.dart';
import '../../../../../../../utils/app_url.dart';
import '../../../../../../../utils/color_const.dart';
import '../../../../../../../utils/image_const.dart';
import '../../matrimony_details_screen.dart';
import '../matrimony_add_details_screen.dart';

class BusinessDetailsFormScreen extends StatefulWidget {
  const BusinessDetailsFormScreen({Key? key}) : super(key: key);

  @override
  State<BusinessDetailsFormScreen> createState() =>
      _BusinessDetailsFormScreenState();
}

class _BusinessDetailsFormScreenState extends State<BusinessDetailsFormScreen> {
  TextEditingController businessName = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController businessType = TextEditingController();
  TextEditingController businessMobileNumber = TextEditingController();
  TextEditingController businessEmail = TextEditingController();
  TextEditingController businessAddress = TextEditingController();

  int selectTextField = -1;

  Future<MatrimonyBusinessMemberDetailsPostModel?>
      addNewMatrimonyMemberBusinessDetails(
          String businessName,
          String businessType,
          occupation,
          mobileNumber,
          businessEmail,
          address) async {
    try {
      String url =
          AppUrl.baseUrl + AppUrl.matrimonyBusinessMemberDetailsPostApi;
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode({
        "businessName": "$businessName",
        "businessType": "$businessType",
        "occupation": "$occupation",
        "mobileNo": "$mobileNumber",
        "businessEmail": "$businessEmail",
        "address": "$address",
      });
      print("data pass : ${request.body}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("Response: ${response.statusCode}");
        var jsonD = jsonDecode(await response.stream.bytesToString());
        return MatrimonyBusinessMemberDetailsPostModel.fromJson(jsonD);
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => MatrimonyAddDetailsScreen(
                    initialindex: 2,
                  )));
        });
        return AlertDialog(
          icon: Image.asset(
            height: 80,
            width: 80,
            filterQuality: FilterQuality.high,
            AssetImageConst.submitted,
          ),
          title: TextConst(
            text: 'New Member Business Data Added!',
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
        padding:
            const EdgeInsets.only(top: 05, left: 10, right: 10, bottom: 05),
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
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TextConst(
                    text: 'BUSINESS DETAILS FORM',
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
                      controller: businessName,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 0;
                        });
                      },
                      hintText: 'Business Name',
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
                      controller: occupation,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 1;
                        });
                      },
                      hintText: 'Occupation',
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
                      controller: businessType,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 2;
                        });
                      },
                      hintText: 'Business Type',
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
                      controller: businessMobileNumber,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 3;
                        });
                      },
                      hintText: 'Mobile No.',
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
                      controller: businessEmail,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 4;
                        });
                      },
                      hintText: 'Business Email',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 50,
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
                      maxLines: 4,
                      controller: businessAddress,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 5;
                        });
                      },
                      hintText: 'Business Address',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AllButtonConst(
                    onPressed: () {
                      if (businessName.text.isNotEmpty &&
                          businessType.text.isNotEmpty &&
                          occupation.text.isNotEmpty &&
                          businessMobileNumber.text.isNotEmpty &&
                          businessEmail.text.isNotEmpty &&
                          businessAddress.text.isNotEmpty) {
                        addNewMatrimonyMemberBusinessDetails(
                            businessName.text.toString(),
                            businessType.text.toString(),
                            occupation.text.toString(),
                            businessMobileNumber.text.toString(),
                            businessEmail.text.toString(),
                            businessAddress.text.toString());
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
