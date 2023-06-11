import 'dart:convert';
import 'dart:io';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_add_details_page/matrimony_add_details_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_add_details_page/matrimony_add_details_tab_page/business_details_form_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_screen.dart';
import 'package:community_app/models/matrimony_personal_membar_details_post_model.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../../../components/all_button_const.dart';
import '../../../../../../../components/text_const.dart';
import '../../../../../../../components/text_field_const.dart';
import '../../../../../../../utils/app_url.dart';
import '../../../../../../../utils/image_const.dart';

class PersonalDetailsFormScreen extends StatefulWidget {
  const PersonalDetailsFormScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsFormScreen> createState() => _PersonalDetailsFormScreenState();
}

class _PersonalDetailsFormScreenState extends State<PersonalDetailsFormScreen> {

  TextEditingController fullName = TextEditingController();
  TextEditingController cast = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController birthPlace = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController interest = TextEditingController();

  int selectTextField = -1;

  Future<MatrimonyPersonaMemberDetailsPostModel?> addNewMatrimonyMemberPersonalDetails(
      String fullName, String castName, age, gender, occupation, dob, height, weight, birthPlace, mobileNumber, email, address, intrest) async {
    try {
      String url = AppUrl.baseUrl + AppUrl.matrimonyPersonalMemberDetailsPostApi;
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode({
        "fullName": "$fullName",
        "castName": "$castName",
        "age": "$age",
        "gender": "$gender",
        "occupation": "$occupation",
        "dob": "$dob",
        "height": "$height",
        "weight": "$weight",
        "birthPlace": "$birthPlace",
        "mobileNo": "$mobileNumber",
        "email": "$email",
        "address": "$address",
        "intrest": "$intrest"
      });
      print("data pass : ${request.body}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("Response: ${response.statusCode}");
        var jsonD = jsonDecode(await response.stream.bytesToString());
        return MatrimonyPersonaMemberDetailsPostModel.fromJson(jsonD);
      } else {
        print("Error");
      }
    } catch (e) {
      print("Error: " + e.toString());
    }
    return null;
  }

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MatrimonyAddDetailsScreen(initialindex: 1)));
        });
        return AlertDialog(
          icon: Image.asset(
            height: 80,
            width: 80,
            filterQuality: FilterQuality.high,
            AssetImageConst.submitted,
          ),
          title: TextConst(
            text: 'New Member Personal Data Added!',
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
  void initState() {
    dob.text = "";
    super.initState();
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
                    text: 'PERSONAL DETAILS FORM',
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
                  GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: _photo == null ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.black.withOpacity(.2),
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        backgroundImage: AssetImage(AssetImageConst.profile),
                        radius: 50.0,
                      ),
                    ) : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 90,
                        height: 90,
                        child: Image.file(
                          _photo!,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black.withOpacity(.2),
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
                      controller: fullName,
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
                      controller: cast,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 1;
                        });
                      },
                      hintText: 'Cast',
                    ),
                  ),
                  const SizedBox(
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
                          keyBoardType: TextInputType.number,
                          controller: age,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 2;
                            });
                          },
                          hintText: 'Age',
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
                          controller: gender,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 3;
                            });
                          },
                          hintText: 'Gender',
                        ),
                      ),
                    ],
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
                      controller: occupation,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 4;
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
                        color: selectTextField == 5
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      controller: dob,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () async {
                        setState(() {
                          selectTextField = 5;
                        });
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  textTheme: TextTheme(
                                    headline1: TextStyle(
                                        fontSize: 72.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins'),
                                    headline6: TextStyle(
                                        fontSize: 36.0, fontFamily: 'Poppins'),
                                    bodyText2: TextStyle(
                                        fontSize: 14.0, fontFamily: 'Poppins'),
                                  ),
                                  colorScheme: ColorScheme.light(
                                    primary: AppColors.appBaseColor,
                                    onPrimary: Colors.black,
                                    onSurface: Colors.black,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                      primary: AppColors.appBaseColor,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);

                          setState(() {
                            dob.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      hintText: 'Date of Birth',
                      iconData: Icons.calendar_today,
                      iconColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
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
                          keyBoardType: TextInputType.number,
                          controller: height,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 6;
                            });
                          },
                          hintText: 'Height',
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
                          keyBoardType: TextInputType.number,
                          controller: weight,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 7;
                            });
                          },
                          hintText: 'Weight',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                          controller: birthPlace,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 8;
                            });
                          },
                          hintText: 'Birth Place',
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
                          readOnly: false,
                          keyBoardType: TextInputType.phone,
                          controller: mobileNumber,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 9;
                            });
                          },
                          hintText: 'Mobile No.',
                        ),
                      ),
                    ],
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
                      controller: email,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 10;
                        });
                      },
                      hintText: 'Email',
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
                        color: selectTextField == 11
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      maxLines: 4,
                      controller: address,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 11;
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
                        color: selectTextField == 12
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      controller: interest,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 12;
                        });
                      },
                      hintText: 'Interest',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AllButtonConst(
                    onPressed: () {
                      if(fullName.text.isNotEmpty && cast.text.isNotEmpty && age.text.isNotEmpty && gender.text.isNotEmpty && occupation.text.isNotEmpty && dob.text.isNotEmpty && height.text.isNotEmpty && weight.text.isNotEmpty && birthPlace.text.isNotEmpty && mobileNumber.text.isNotEmpty && email.text.isNotEmpty && address.text.isNotEmpty && interest.text.isNotEmpty) {
                        addNewMatrimonyMemberPersonalDetails(
                            fullName.text.toString(),
                            cast.text.toString(),
                            age.text,
                            gender.text.toString(),
                            occupation.text.toString(),
                            dob.text.toString(),
                            height.text,
                            weight.text,
                            birthPlace.text.toString(),
                            mobileNumber.text,
                            email.text.toString(),
                            address.text.toString(),
                            interest.text.toString()
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
  void _showPicker(context) {
    showModalBottomSheet(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        borderSide: BorderSide.none,
      ),
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 05),
                    width: 50,
                    height: 06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.appBaseColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              imgFromGallery();
                              Navigator.of(context).pop();
                            },
                            child: Card(
                              elevation: 8,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppColors.appBaseColor,
                                  width: 2,
                                ),
                              ),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColors.appBaseColor),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      width: 35,
                                      filterQuality: FilterQuality.high,
                                      image: AssetImage(AssetImageConst.gallery_pick),
                                    ),
                                    TextConst(
                                      text: 'GALLERY',
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black.withOpacity(.4),
                            indent: 15,
                            endIndent: 15,
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: (){
                              imgFromCamera();
                              Navigator.of(context).pop();
                            },
                            child: Card(
                              elevation: 8,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppColors.appBaseColor,
                                  width: 2,
                                ),
                              ),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColors.appBaseColor),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      width: 35,
                                      filterQuality: FilterQuality.high,
                                      image: AssetImage(AssetImageConst.camera_pick),
                                    ),
                                    TextConst(
                                      text: 'CAMERA',
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
