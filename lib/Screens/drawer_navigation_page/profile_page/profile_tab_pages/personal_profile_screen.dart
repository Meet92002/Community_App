import 'dart:convert';
import 'dart:io';
import 'package:community_app/components/all_button_const.dart';
import 'package:community_app/components/text_const.dart';
import 'package:community_app/components/text_field_const.dart';
import 'package:community_app/services/profile_shared_preferences.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/personal_profile_model.dart';
import '../../../../utils/app_url.dart';

class PersonalProfileScreen extends StatefulWidget {
  String number;
  PersonalProfileScreen({Key? key,required this.number}) : super(key: key);
  @override
  State<PersonalProfileScreen> createState() => _PersonalProfileScreenState();
}

class _PersonalProfileScreenState extends State<PersonalProfileScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController castName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dob = TextEditingController();

  late SharedPreferences sharedPreferences;

  int selectColor = -1;

  int selectTextField = -1;

  int selectBloodGp = -1;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

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

  @override
  void initState() {
    dob.text = "";
    super.initState();
    initalGetSavedData();
    mobileNumber = TextEditingController(text: widget.number);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    super.dispose();
  }

  void initalGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString('userData')!);

    UserProfileSharedPreferences userProfileSharedPreferences =
        UserProfileSharedPreferences.fromJson(jsonData);

    if (jsonData.isNotEmpty) {
      firstName.value =
          TextEditingValue(text: userProfileSharedPreferences.firstName);
      lastName.value =
          TextEditingValue(text: userProfileSharedPreferences.lastName);
      dob.value = TextEditingValue(text: userProfileSharedPreferences.dob);
      mobileNumber.value =
          TextEditingValue(text: userProfileSharedPreferences.mobileNo);
      email.value = TextEditingValue(text: userProfileSharedPreferences.email);
      castName.value =
          TextEditingValue(text: userProfileSharedPreferences.castName);
      gender.value =
          TextEditingValue(text: userProfileSharedPreferences.gender);
    }
  }

  void storeData() {
    UserProfileSharedPreferences userProfileSharedPreferences =
        UserProfileSharedPreferences(firstName.text, lastName.text, dob.text,
            mobileNumber.text, email.text, castName.text, gender.text);

    String userData = jsonEncode(userProfileSharedPreferences);
    print(userData);

    sharedPreferences.setString('userData', userData);
  }

  Future<PersonalProfileModel?> addPersonalProfile(
      String firstName,
      String lastName,
      dob,
      mobileNumber,
      String email,
      String castName,
      String gender
      ) async {
    try {
      String url = AppUrl.baseUrl + AppUrl.addPersonalProfileApi;
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode({
        "firstName": "$firstName",
        "lastName": "$lastName",
        "dob": "$dob",
        "mobileNo": "$mobileNumber",
        "email": "$email",
        "castName": "$castName",
        "gender": "$gender"
      });
      print("data pass : ${request.body}");
      request.headers.addAll(headers);
      print("headers: $headers");
      http.StreamedResponse response = await request.send();
      print("Response: $response");
      if (response.statusCode == 200) {
        print("Response: ${response.statusCode}");
        var jsonD = jsonDecode(await response.stream.bytesToString());
        print(jsonD);
        return PersonalProfileModel.fromJson(jsonD);
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
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TextConst(
                    text: 'PERSONAL DETAILS',
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
                  GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: _photo == null
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.black.withOpacity(.2),
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              backgroundImage:
                                  AssetImage(AssetImageConst.profile),
                              radius: 50.0,
                            ),
                          )
                        : ClipRRect(
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
                    color: Colors.black.withOpacity(.3),
                    indent: 05,
                    endIndent: 05,
                    height: 20,
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
                            color: selectTextField == 0
                                ? AppColors.appBaseColor
                                : Colors.black.withOpacity(.2),
                          ),
                        ),
                        child: TextFieldConst(
                          readOnly: false,
                          controller: firstName,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 0;
                            });
                          },
                          hintText: 'First name',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.31,
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
                          controller: lastName,
                          textAlignVertical: TextAlignVertical.bottom,
                          filled: true,
                          onTap: () {
                            setState(() {
                              selectTextField = 1;
                            });
                          },
                          hintText: 'Last name',
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
                        color: selectTextField == 2
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      controller: dob,
                      readOnly: true,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () async {
                        setState(() {
                          selectTextField = 2;
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
                              DateFormat('yyyy/MM/dd').format(pickedDate);
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
                      controller: mobileNumber,
                      keyBoardType: TextInputType.phone,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 3;
                        });
                      },
                      hintText: 'Mobile Number',
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
                        color: selectTextField == 4
                            ? AppColors.appBaseColor
                            : Colors.black.withOpacity(.2),
                      ),
                    ),
                    child: TextFieldConst(
                      readOnly: false,
                      controller: email,
                      keyBoardType: TextInputType.emailAddress,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 4;
                        });
                      },
                      hintText: 'Email',
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
                      controller: castName,
                      textAlignVertical: TextAlignVertical.bottom,
                      filled: true,
                      onTap: () {
                        setState(() {
                          selectTextField = 5;
                        });
                      },
                      hintText: 'Cast Name',
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
                        color: selectTextField == 6
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
                          selectTextField = 6;
                        });
                      },
                      hintText: 'Gender',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AllButtonConst(
                    onPressed: () {
                      if (firstName.text.isNotEmpty &&
                          lastName.text.isNotEmpty &&
                          dob.text.isNotEmpty &&
                          mobileNumber.text.isNotEmpty &&
                          email.text.isNotEmpty &&
                          castName.text.isNotEmpty &&
                          gender.text.isNotEmpty) {
                        addPersonalProfile(
                            firstName.text.toString(),
                            lastName.text.toString(),
                            dob.text.toString(),
                            mobileNumber.text,
                            email.text.toString(),
                            castName.text.toString(),
                            gender.text.toString());
                        _showMyDialog();
                        storeData();
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
          child: Container(
            child: new Wrap(
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
                              onTap: () {
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
                                    border: Border.all(
                                        color: AppColors.appBaseColor),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        width: 35,
                                        filterQuality: FilterQuality.high,
                                        image: AssetImage(
                                            AssetImageConst.gallery_pick),
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
                              onTap: () {
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
                                    border: Border.all(
                                        color: AppColors.appBaseColor),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        width: 35,
                                        filterQuality: FilterQuality.high,
                                        image: AssetImage(
                                            AssetImageConst.camera_pick),
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
          ),
        );
      },
    );
  }
}
