import 'dart:convert';

import 'package:community_app/services/profile_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../components/all_button_const.dart';
import '../../../../components/text_const.dart';
import '../../../../components/text_field_const.dart';
import '../../../../utils/color_const.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({Key? key}) : super(key: key);

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  TextEditingController businessName = TextEditingController();
  TextEditingController businessCategory = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController aboutBusiness = TextEditingController();
  TextEditingController officeNo = TextEditingController();
  TextEditingController officeName = TextEditingController();
  TextEditingController officeCity = TextEditingController();
  TextEditingController officeState = TextEditingController();
  TextEditingController officeCountry = TextEditingController();
  TextEditingController officeZipCode = TextEditingController();
  TextEditingController officeNearBy = TextEditingController();

  int selectTextField = -1;

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initalGetBusinessSavedData();

  }

  void initalGetBusinessSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString('businessData')!);

    BusinessProfileSharedPreferences businessProfileSharedPreferences =
        BusinessProfileSharedPreferences.fromJson(jsonData);

    if (jsonData.isNotEmpty) {

      businessName.value =
          TextEditingValue(text: businessProfileSharedPreferences.businessName.toString());
      businessCategory.value = TextEditingValue(
          text: businessProfileSharedPreferences.businessCategory);
      occupation.value =
          TextEditingValue(text: businessProfileSharedPreferences.occupation);
      aboutBusiness.value = TextEditingValue(
          text: businessProfileSharedPreferences.aboutBusiness);
      officeNo.value =
          TextEditingValue(text: businessProfileSharedPreferences.officeNo);
      officeName.value =
          TextEditingValue(text: businessProfileSharedPreferences.officeName);
      officeCity.value =
          TextEditingValue(text: businessProfileSharedPreferences.officeCity);
      officeState.value =
          TextEditingValue(text: businessProfileSharedPreferences.officeState);
      officeCountry.value = TextEditingValue(
          text: businessProfileSharedPreferences.officeCountry);
      officeZipCode.value = TextEditingValue(
          text: businessProfileSharedPreferences.officeZipCode);
      officeNearBy.value =
          TextEditingValue(text: businessProfileSharedPreferences.officeNearBy);
    }
  }

  void storeBusinessData() {
    BusinessProfileSharedPreferences businessProfileSharedPreferences =
        BusinessProfileSharedPreferences(
            businessName.text,
            businessCategory.text,
            occupation.text,
            aboutBusiness.text,
            officeNo.text,
            officeName.text,
            officeCity.text,
            officeState.text,
            officeCountry.text,
            officeZipCode.text,
            officeNearBy.text);

    String businessData = jsonEncode(businessProfileSharedPreferences);
    print(businessData);

    sharedPreferences.setString('businessData', businessData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TextConst(
                    text: 'BUSINESS DETAILS',
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    letterSpacing: 4.0,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(.3),
                    indent: 05,
                    endIndent: 05,
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
                  SizedBox(
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
                      controller: businessCategory,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 1;
                        });
                      },
                      hintText: 'Business Category',
                    ),
                  ),
                  SizedBox(
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
                      controller: occupation,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 2;
                        });
                      },
                      hintText: 'Occupation',
                    ),
                  ),
                  SizedBox(
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
                      maxLines: 4,
                      controller: aboutBusiness,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 3;
                        });
                      },
                      hintText: 'About Business',
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 05,
                    endIndent: 05,
                    height: 25,
                    thickness: 1,
                  ),
                  TextConst(
                    text: 'BUSINESS ADDRESS DETAILS',
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    letterSpacing: 4.0,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(.3),
                    indent: 05,
                    endIndent: 05,
                    height: 20,
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
                      controller: officeNo,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 4;
                        });
                      },
                      hintText: 'Office No. / Building No.',
                    ),
                  ),
                  SizedBox(
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
                      controller: officeName,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 5;
                        });
                      },
                      hintText: 'Office Name',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.31,
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
                          controller: officeCity,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 6;
                            });
                          },
                          hintText: 'City',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.31,
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
                          controller: officeState,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 7;
                            });
                          },
                          hintText: 'State',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.31,
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
                          controller: officeCountry,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 8;
                            });
                          },
                          hintText: 'Country',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.31,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectTextField == 9
                                ? AppColors.appBaseColor
                                : Colors.black.withOpacity(.2),
                          ),
                        ),
                        child: TextFieldConst(
                          keyBoardType: TextInputType.number,
                          readOnly: false,
                          controller: officeZipCode,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 9;
                            });
                          },
                          hintText: 'Zipcode',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectTextField == 10
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      controller: officeNearBy,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 10;
                        });
                      },
                      hintText: 'Landmark',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AllButtonConst(
                    onPressed: () {
                      storeBusinessData();
                      setState(() {

                      });
                    },
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    text: 'UPDATE',
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
