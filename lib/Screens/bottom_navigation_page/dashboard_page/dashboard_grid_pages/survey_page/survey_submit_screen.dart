import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/survey_page/survey_screen.dart';
import 'package:community_app/components/text_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../components/app_bar_const.dart';

class SurveySubmitScreen extends StatefulWidget {
  const SurveySubmitScreen({Key? key}) : super(key: key);

  @override
  State<SurveySubmitScreen> createState() => _SurveySubmitScreenState();
}

class _SurveySubmitScreenState extends State<SurveySubmitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          text: '',
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SurveyScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Card(
              elevation: 5,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.3),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.875,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 10, bottom: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(AssetImageConst.surveySubmitted),
                        backgroundColor: Colors.transparent,
                        radius: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextConst(
                        text: 'Matrimony Survey Submitted!',
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      SizedBox(
                        height: 05,
                      ),
                      TextConst(
                        text: 'Thanks for fill up survey!',
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                      TextConst(
                        text: 'We are trying to improve the best!',
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                      Divider(
                        color: Colors.black.withOpacity(.3),
                        endIndent: 30,
                        indent: 30,
                        height: 50,
                      ),
                      TextConst(
                        text: 'Rate this survey',
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 5,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(.3),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: 10,right: 25,left: 25),
                          width: MediaQuery.of(context).size.width / 1.35,
                          height: 300,
                          child: Column(
                            children: [
                              TextConst(
                                text: 'How much like this survey?',
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RatingBar.builder(
                                glow: false,
                                itemSize: 35,
                                initialRating: 0,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  switch (index) {
                                    case 0:
                                      return Icon(
                                        Icons.sentiment_very_dissatisfied,
                                        color: Colors.red,
                                      );
                                    case 1:
                                      return Icon(
                                        Icons.sentiment_dissatisfied,
                                        color: Colors.redAccent,
                                      );
                                    case 2:
                                      return Icon(
                                        Icons.sentiment_neutral,
                                        color: Colors.amber,
                                      );
                                    case 3:
                                      return Icon(
                                        Icons.sentiment_satisfied,
                                        color: Colors.lightGreen,
                                      );
                                    case 4:
                                      return Icon(
                                        Icons.sentiment_very_satisfied,
                                        color: Colors.green,
                                      );
                                    default:
                                      return Container();
                                  }
                                },
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextConst(
                                text: 'Give us feedback',
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                              SizedBox(
                                height: 05,
                              ),
                              TextField(
                                scrollPhysics: BouncingScrollPhysics(),
                                maxLines: 5,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                  hintText: 'Enter Feedback Here',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: 140,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.appBaseColor,
                                ),
                                child: TextButton(
                                  child: TextConst(
                                    text: 'SUBMIT FEEDBACK',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SurveyScreen()));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
