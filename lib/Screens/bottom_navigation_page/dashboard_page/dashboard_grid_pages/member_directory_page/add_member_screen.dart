import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../../../../components/all_button_const.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';
import '../../../../../components/text_field_const.dart';
import '../../../../../models/member_post_model.dart';
import '../../../../../utils/app_url.dart';
import '../../../../../utils/color_const.dart';
import '../../../../../utils/image_const.dart';
import 'member_directory_screen.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({Key? key}) : super(key: key);

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController castName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController marriageAnniversary = TextEditingController();
  TextEditingController EmergancyContact = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController businessType = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController subCategory = TextEditingController();
  TextEditingController product = TextEditingController();
  TextEditingController formation = TextEditingController();
  TextEditingController establishment = TextEditingController();
  TextEditingController emialAddress = TextEditingController();
  TextEditingController businessAddress = TextEditingController();

  int selectTextField = -1;

  Future<MemberPostModel?> addNewMember(
      String name,
      String castName,
      mobileNumber,
      dob,
      marriageAnniversary,
      EmergancyContact,
      Address,
      companyName,
      businessType,
      category,
      subCategory,
      product,
      formation,
      establishment,
      emialAddress,
      businessAddress) async {
    try {
      String url =  AppUrl.baseUrl + AppUrl.addNewMember;
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode({
        "name": "$name",
        "castName": "$castName",
        "mobileNo": "$mobileNumber",
        "dob": "$dob",
        "marriageAnniversary": "$marriageAnniversary",
        "EmergancyContact": "$EmergancyContact",
        "Address": "$Address",
        "companyName": "$companyName",
        "businessType": "$businessType",
        "category": "$category",
        "subCategory": "$subCategory",
        "product": "$product",
        "formation": "$formation",
        "establishment": "$establishment",
        "emialAddress": "$emialAddress",
        "businessAddress": "$businessAddress",
      });
      print("data pass : ${request.body}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("Response: ${response.statusCode}");
        var jsonD = jsonDecode(await response.stream.bytesToString());
        return MemberPostModel.fromJson(jsonD);
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
          Navigator.of(context).pop();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MemberDirectoryScreen()));
        });
        return AlertDialog(
          icon: Image.asset(
            height: 80,
            width: 80,
            filterQuality: FilterQuality.high,
            AssetImageConst.submitted,
          ),
          title: TextConst(
            text: 'New Member Added!',
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'ADD MEMBER',
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
      body: Padding(
        padding:
        const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black.withOpacity(.2),
            ),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextConst(
                      text: 'ADD MEMBER FORM',
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
                        controller: name,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 0;
                          });
                        },
                        hintText: 'Full Name',
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
                        controller: castName,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 1;
                          });
                        },
                        hintText: 'Cast Name',
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
                        controller: mobileNumber,
                        keyBoardType: TextInputType.phone,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 2;
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
                          color: selectTextField == 3
                              ? AppColors.appBaseColor
                              : Colors.black.withOpacity(.2),
                        ),
                      ),
                      child: TextFieldConst(
                        readOnly: false,
                        controller: dob,
                        keyBoardType: TextInputType.phone,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 3;
                          });
                        },
                        hintText: 'Date Of Birth.',
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
                        controller: marriageAnniversary,
                        keyBoardType: TextInputType.phone,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 4;
                          });
                        },
                        hintText: 'Marriage Anniversary',
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
                        controller: EmergancyContact,
                        keyBoardType: TextInputType.phone,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 5;
                          });
                        },
                        hintText: 'Emergancy Contact',
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
                        controller: Address,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 6;
                          });
                        },
                        hintText: 'Address',
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
                        controller: companyName,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 7;
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
                          color: selectTextField == 8
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
                            selectTextField = 8;
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
                          color: selectTextField == 9
                              ? AppColors.appBaseColor
                              : Colors.black.withOpacity(.2),
                        ),
                      ),
                      child: TextFieldConst(
                        readOnly: false,
                        controller: category,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 9;
                          });
                        },
                        hintText: 'Category',
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
                          color: selectTextField == 10
                              ? AppColors.appBaseColor
                              : Colors.black.withOpacity(.2),
                        ),
                      ),
                      child: TextFieldConst(
                        readOnly: false,
                        controller: subCategory,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 10;
                          });
                        },
                        hintText: 'SubCategory',
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
                          color: selectTextField == 11
                              ? AppColors.appBaseColor
                              : Colors.black.withOpacity(.2),
                        ),
                      ),
                      child: TextFieldConst(
                        readOnly: false,
                        controller: product,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 11;
                          });
                        },
                        hintText: 'Product',
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
                          color: selectTextField == 12
                              ? AppColors.appBaseColor
                              : Colors.black.withOpacity(.2),
                        ),
                      ),
                      child: TextFieldConst(
                        readOnly: false,
                        controller: formation,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 12;
                          });
                        },
                        hintText: 'Formation',
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
                          color: selectTextField == 13
                              ? AppColors.appBaseColor
                              : Colors.black.withOpacity(.2),
                        ),
                      ),
                      child: TextFieldConst(
                        readOnly: false,
                        controller: establishment,
                        keyBoardType: TextInputType.phone,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 13;
                          });
                        },
                        hintText: 'Establishment',
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
                          color: selectTextField == 14
                              ? AppColors.appBaseColor
                              : Colors.black.withOpacity(.2),
                        ),
                      ),
                      child: TextFieldConst(
                        readOnly: false,
                        controller: emialAddress,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 14;
                          });
                        },
                        hintText: 'Email Address',
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
                          color: selectTextField == 15
                              ? AppColors.appBaseColor
                              : Colors.black.withOpacity(.2),
                        ),
                      ),
                      child: TextFieldConst(
                        readOnly: false,
                        controller: businessAddress,
                        textAlignVertical: TextAlignVertical.bottom,
                        filled: true,
                        onTap: () {
                          setState(() {
                            selectTextField = 15;
                          });
                        },
                        hintText: 'Business/Job Address',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AllButtonConst(
                      onPressed: () {
                        if (name.text.isNotEmpty &&
                            castName.text.isNotEmpty &&
                            mobileNumber.text.isNotEmpty &&
                            dob.text.isNotEmpty &&
                            marriageAnniversary.text.isNotEmpty &&
                            EmergancyContact.text.isNotEmpty &&
                            Address.text.isNotEmpty &&
                            companyName.text.isNotEmpty &&
                            businessType.text.isNotEmpty &&
                            category.text.isNotEmpty &&
                            subCategory.text.isNotEmpty &&
                            product.text.isNotEmpty &&
                            formation.text.isNotEmpty &&
                            establishment.text.isNotEmpty &&
                            emialAddress.text.isNotEmpty &&
                            businessAddress.text.isNotEmpty) {
                          addNewMember(
                              name.text.toString(),
                              castName.text.toString(),
                              mobileNumber.text,
                              dob.text,
                              marriageAnniversary.text,
                              EmergancyContact.text,
                              Address.text.toString(),
                              companyName.text.toString(),
                              businessType.text.toString(),
                              category.text.toString(),
                              subCategory.text.toString(),
                              product.text.toString(),
                              formation.text.toString(),
                              establishment.text.toString(),
                              emialAddress.text.toString(),
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
                      text: 'ADD MEMBER',
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
      ),
    );
  }
}