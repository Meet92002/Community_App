import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/survey_page/survey_submit_screen.dart';
import 'package:community_app/components/icon_button_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:flutter/material.dart';
import '../../../../../components/text_const.dart';

class SurveyQuestionScreen extends StatefulWidget {
  const SurveyQuestionScreen({Key? key}) : super(key: key);

  @override
  State<SurveyQuestionScreen> createState() => _SurveyQuestionScreenState();
}

class _SurveyQuestionScreenState extends State<SurveyQuestionScreen> {

  List boolList = [true,true,true,true,true];

  void _popupDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Submit Survey'),
            content: const Text('Are you sure want to attempt all question!'),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SurveySubmitScreen()));
                },
                child: const Text(
                  'YES',
                  style: TextStyle(
                    color: AppColors.appBaseColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'NO',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        title: TextConst(
          text: 'Matrimony Survey',
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          iconSize: 20,
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline_rounded),
            iconSize: 25,
            color: Colors.black,
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    titlePadding: EdgeInsets.only(left: 10,top: 10,right: 10),
                    contentPadding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About Us Survey'),
                        Divider(
                          color: Colors.black.withOpacity(.3),
                        ),
                      ],
                    ),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(.3),
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text('• Attempt all 10 Questions'),
                          Text('• Please select appropriate answer'),
                          Text('• This is a demo alert dialog'),
                          Text('• This is a demo alert dialog'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      Center(
                        child: Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.indigo,
                          ),
                          child: TextButton(
                            child: TextConst(
                              text: 'OK',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.813,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(.3),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.47,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextConst(
                                text: 'Q1. What improvement in our matrimony module in community?',
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                              Divider(
                                color: Colors.black.withOpacity(.3),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 2.65,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 5,
                                  itemBuilder: (BuildContext context, index) {
                                    return Card(
                                      elevation: 5,
                                      shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(.3),
                                        ),
                                      ),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.only(right: 05,left: 05),
                                        horizontalTitleGap: 05,
                                        leading: IconButtonConst(
                                          function: (){
                                            boolList[index] = !boolList[index];
                                            setState(() {

                                            });
                                          },
                                          icon: boolList[index] ? Icons.check_box_outline_blank_rounded : Icons.check_box_rounded,
                                          iconSize: 20,
                                          color: Colors.black,
                                        ),
                                        title: TextConst(
                                          text: 'Some minor changes in matrimony module',
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  },
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, //New
                    blurRadius: 3.0,
                    spreadRadius: -7,
                    offset: Offset(0, -10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 05,right: 40,left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 115,
                            height: MediaQuery.of(context).size.height / 18.20,
                            child: Column(
                              children: [
                                TextConst(
                                  text: '05 / 10',
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.appBaseColor,
                                ),
                                TextConst(
                                  text: 'Question Attempt',
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black.withOpacity(.3),
                          ),
                          Container(
                            width: 120,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.appBaseColor,
                            ),
                            child: TextButton(
                              child: TextConst(
                                text: 'SUBMIT SURVEY',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _popupDialog(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
