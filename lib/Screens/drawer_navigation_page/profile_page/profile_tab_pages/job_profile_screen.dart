import 'dart:convert';

import 'package:community_app/services/profile_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../components/all_button_const.dart';
import '../../../../components/text_const.dart';
import '../../../../components/text_field_const.dart';
import '../../../../utils/color_const.dart';

class JobProfileScreen extends StatefulWidget {
  const JobProfileScreen({Key? key}) : super(key: key);

  @override
  State<JobProfileScreen> createState() => _JobProfileScreenState();
}

class _JobProfileScreenState extends State<JobProfileScreen> {

  TextEditingController companyController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController experianceController = TextEditingController();

  int selectTextField = -1;

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initalGetJobSavedData();
  }

  void initalGetJobSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> jsonData =
    jsonDecode(sharedPreferences.getString('jobData')!);

    JobProfileSharedPreferences jobProfileSharedPreferences =
    JobProfileSharedPreferences.fromJson(jsonData);

    if (jsonData.isNotEmpty) {
      companyController.value =
          TextEditingValue(text: jobProfileSharedPreferences.companyController);
      postController.value =
          TextEditingValue(text: jobProfileSharedPreferences.postController);
      experianceController.value = TextEditingValue(text: jobProfileSharedPreferences.experianceController);
    }
  }

  void storeJobData() {
    JobProfileSharedPreferences jobProfileSharedPreferences =
    JobProfileSharedPreferences(companyController.text, postController.text, experianceController.text);

    String jobData = jsonEncode(jobProfileSharedPreferences);
    print(jobData);

    sharedPreferences.setString('jobData', jobData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
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
            padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
            child: Column(
              children: [
                TextConst(
                  text: 'JOB DETAILS',
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
                    controller: companyController,
                    textAlignVertical: TextAlignVertical.bottom,
                    filled: true,
                    onTap: () {
                      setState(() {
                        selectTextField = 0;
                      });
                    },
                    hintText: 'Company Name',
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
                    controller: postController,
                    textAlignVertical: TextAlignVertical.bottom,
                    filled: true,
                    onTap: () {
                      setState(() {
                        selectTextField = 1;
                      });
                    },
                    hintText: 'Present Post',
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
                    controller: experianceController,
                    textAlignVertical: TextAlignVertical.bottom,
                    filled: true,
                    onTap: () {
                      setState(() {
                        selectTextField = 2;
                      });
                    },
                    hintText: 'Company Experience',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                AllButtonConst(
                  onPressed: (){
                    storeJobData();
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
    );
  }
}
