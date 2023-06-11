import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/survey_page/survey_question_screen.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'Survey',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 05,right: 05,left: 05,bottom: 10),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.3),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.080,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConst(
                        text: 'Survey is available!',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                      TextConst(
                        text: "New survey is available for improve in community!",
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(.3),
              endIndent: 10,
              indent: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
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
                      child: ListTile(
                        dense: true,
                        leading: Image(
                          width: 35,
                          height: 35,
                          image: AssetImage(AssetImageConst.matrimonySurvey),
                          filterQuality: FilterQuality.high,
                        ),
                        title: TextConst(
                          text: 'Matrimony Survey',
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        subtitle: TextConst(
                          text: '10 / 10 Questions',
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                        trailing: Container(
                          width: 70,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.appBaseColor,
                          ),
                          child: TextButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SurveyQuestionScreen()));
                            },
                            child: TextConst(
                              text: 'Attempt',
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
