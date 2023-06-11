import 'package:community_app/components/text_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import '../../../components/app_bar_const.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'About Us',
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
        padding: const EdgeInsets.only(top: 10, left: 05, right: 05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black.withOpacity(.2),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        TextConst(
                          text: 'App Logo',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          color: Colors.black.withOpacity(.2),
                          height: 30,
                        ),
                        Image.asset(
                          AssetImageConst.appLogo,
                          width: 130,
                          height: 130,
                          filterQuality: FilterQuality.high,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 05,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                        height: MediaQuery.of(context).size.height * 0.122,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black.withOpacity(.2),
                            ),
                            color: Colors.white),
                        child: Column(
                          children: [
                            TextConst(
                              text: 'App Name',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              color: Colors.black.withOpacity(.2),
                              height: 30,
                            ),
                            TextConst(
                              text: 'Community',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 05,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                        height: MediaQuery.of(context).size.height * 0.122,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black.withOpacity(.2),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            TextConst(
                              text: 'App Version',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              color: Colors.black.withOpacity(.2),
                              height: 30,
                            ),
                            TextConst(
                              text: 'v0.0.0',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 05,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.62,
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black.withOpacity(.2),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    TextConst(
                      text: 'About App',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: Colors.black.withOpacity(.2),
                      height: 30,
                    ),
                    TextConst(
                      text: 'Length and appearance do whether is a paragraph. For instance, particularly journalistic styles, a paragraph can be just one sentence long. Length and appearance do not determine Length and appearance do not determine whether is a paragraph. For instance, particularly journalistic styles, whether a section in a paper is a paragraph. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph. Length and appearance do not determine whether a section in a paper is a paragraph. Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. Length and appearance do not determine whether a section in a paper is a paragraph. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. Length and appearance do not determine whether a section in a paper is a paragraph. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. In reality, though, the unity and coherence what constitutes a paragraph. what constitutes a paragraph.',
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                      textAlign: TextAlign.justify,
                    )
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
