import 'package:community_app/Screens/home_page.dart';
import 'package:community_app/components/text_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/font_style_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../components/all_button_const.dart';
import '../../../components/app_bar_const.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
        });
        return AlertDialog(
          icon: Image.asset(
            height: 80,
            width: 80,
            filterQuality: FilterQuality.high,
            AssetImageConst.submitted,
          ),
          title: TextConst(
            text: 'Feedback Submitted!',
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
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Feedback',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,right: 05,left: 05),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.869,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black.withOpacity(.2),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.191,
                    child: Card(
                      elevation: 5,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Divider(
                                height: 80,
                                color: Colors.black.withOpacity(.2),
                                thickness: 2,
                              ),
                              Positioned(
                                top: 15,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.65,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.appBaseColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      TextConst(
                                        text: 'Give Us Feedback',
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextConst(
                            text: 'Rate Your Experience',
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 05,
                          ),
                          TextConst(
                            text: 'How was your total conspiracy?',
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            itemSize: 40,
                            glow: false,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star_rounded,
                              color: AppColors.appBaseColor,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Divider(
                            color: Colors.black.withOpacity(.2),
                            height: 40,
                          ),
                          TextConst(
                            text: 'Tell us what can be improved?',
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: MultiSelectContainer(
                              textStyles: MultiSelectTextStyles(
                                selectedTextStyle: AppFontStyle.poppinsRegularTextStyle(
                                  13,
                                  fontWeight: FontWeight.w600,
                                  fontColor: Colors.white,
                                ),
                                textStyle: AppFontStyle.poppinsRegularTextStyle(
                                  13,
                                  fontWeight: FontWeight.w600,
                                  fontColor: Colors.black,
                                ),
                                disabledTextStyle: AppFontStyle.poppinsRegularTextStyle(
                                  13,
                                  fontColor: Colors.grey,
                                ),
                              ),
                              animations: MultiSelectAnimations(
                                decorationAnimationCurve: Curves.linear,
                              ),
                              itemsDecoration: MultiSelectDecorations(
                                selectedDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.appBaseColor,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.appBaseColor,
                                  ),
                                ),
                              ),
                              itemsPadding: const EdgeInsets.all(8),
                              prefix: MultiSelectPrefix(
                                selectedPrefix: const Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                                disabledPrefix: const Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.do_disturb_alt_sharp,
                                    size: 14,
                                  ),
                                ),
                              ),
                              items: [
                                MultiSelectCard(value: 'Overall Support', label: 'Overall Support'),
                                MultiSelectCard(value: 'Customer Services', label: 'Customer Services'),
                                MultiSelectCard(value: 'Speed and Efficiency', label: 'Speed and Efficiency'),
                                MultiSelectCard(value: 'Transparency', label: 'Transparency'),
                                MultiSelectCard(value: 'Designing', label: 'Designing'),
                                MultiSelectCard(value: 'App Quality', label: 'App Quality'),
                                MultiSelectCard(value: 'UI/UX', label: 'UI/UX'),
                              ],
                              onChange: (allSelectedItems, selectedItem) {

                              }
                            ),
                          ),
                          Divider(
                            color: Colors.black.withOpacity(.2),
                            height: 65,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.appBaseColor,
                                ),
                              ),
                              child: TextFormField(
                                maxLines: 8,
                                cursorColor: AppColors.appBaseColor,
                                style: AppFontStyle.poppinsRegularTextStyle(
                                  16,
                                  fontColor: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Tell us how can we improve...',
                                  hintStyle: AppFontStyle.poppinsRegularTextStyle(
                                    16,
                                    fontColor: Colors.grey,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15,left: 15),
                            child: AllButtonConst(
                              onPressed: () {
                                _showMyDialog();
                              },
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              text: 'Submit Feedback',
                              elevation: 0,
                              color: AppColors.appBaseColor,
                              fontSize: 17,
                              textColor: Colors.white,
                            ),
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
      ),
    );
  }
}
