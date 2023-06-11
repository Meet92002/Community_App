import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../components/all_button_const.dart';
import '../../../../components/text_const.dart';
import '../../../../components/text_field_const.dart';
import '../../../../services/profile_shared_preferences.dart';
import '../../../../utils/color_const.dart';
import '../../../../utils/image_const.dart';

class AddressProfileScreen extends StatefulWidget {
  const AddressProfileScreen({Key? key}) : super(key: key);

  @override
  State<AddressProfileScreen> createState() => _AddressProfileScreenState();
}

class _AddressProfileScreenState extends State<AddressProfileScreen> {

  TextEditingController flatNo = TextEditingController();
  TextEditingController buildingName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  late SharedPreferences sharedPreferences;

  int selectTextField = -1;

  @override
  void initState() {
    super.initState();
    initalGetAddressSavedData();
  }

  void initalGetAddressSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> jsonData =
    jsonDecode(sharedPreferences.getString('addressData')!);

    AddressProfileSharedPreferences addressProfileSharedPreferences =
    AddressProfileSharedPreferences.fromJson(jsonData);

    if (jsonData.isNotEmpty) {
      flatNo.value =
          TextEditingValue(text: addressProfileSharedPreferences.flatNo);
      buildingName.value =
          TextEditingValue(text: addressProfileSharedPreferences.buildingName);
      city.value = TextEditingValue(text: addressProfileSharedPreferences.city);
      state.value =
          TextEditingValue(text: addressProfileSharedPreferences.state);
      country.value = TextEditingValue(text: addressProfileSharedPreferences.country);
      zipCode.value =
          TextEditingValue(text: addressProfileSharedPreferences.zipCode);
    }
  }

  void storeAddressData() {
    AddressProfileSharedPreferences addressProfileSharedPreferences =
    AddressProfileSharedPreferences(flatNo.text, buildingName.text, city.text,
        state.text, country.text, zipCode.text);

    String addressData = jsonEncode(addressProfileSharedPreferences);
    print(addressData);

    sharedPreferences.setString('addressData', addressData);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
          icon: Image.asset(
            height: 80,
            width: 80,
            filterQuality: FilterQuality.high,
            AssetImageConst.submitted,
          ),
          title: TextConst(
            text: 'Member Data Updated!',
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
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TextConst(
                    text: 'ADDRESS DETAILS',
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
                      controller: flatNo,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 0;
                        });
                      },
                      hintText: 'Flat / Building No.',
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
                      controller: buildingName,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 1;
                        });
                      },
                      hintText: 'Apartment / Building Name',
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
                            color: selectTextField == 2
                                ? AppColors.appBaseColor
                                : Colors.black.withOpacity(.2),
                          ),
                        ),
                        child: TextFieldConst(
                          readOnly: false,
                          controller: city,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 2;
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
                            color: selectTextField == 3
                                ? AppColors.appBaseColor
                                : Colors.black.withOpacity(.2),
                          ),
                        ),
                        child: TextFieldConst(
                          readOnly: false,
                          controller: state,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 3;
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
                            color: selectTextField == 4
                                ? AppColors.appBaseColor
                                : Colors.black.withOpacity(.2),
                          ),
                        ),
                        child: TextFieldConst(
                          readOnly: false,
                          controller: country,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 4;
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
                            color: selectTextField == 5
                                ? AppColors.appBaseColor
                                : Colors.black.withOpacity(.2),
                          ),
                        ),
                        child: TextFieldConst(
                          keyBoardType: TextInputType.number,
                          readOnly: false,
                          controller: zipCode,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 5;
                            });
                          },
                          hintText: 'Zipcode',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AllButtonConst(
                    onPressed: (){
                      _showMyDialog();
                      storeAddressData();
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
