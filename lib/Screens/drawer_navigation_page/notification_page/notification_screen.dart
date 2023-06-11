import 'package:community_app/components/text_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/font_style_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import '../../../components/app_bar_const.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<String> para = [
    "1. Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc.",
    "2. Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc.",
    "3. Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc.",
    "4. Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc.",
    "5. Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc.",
  ];

  Widget slideLeftBackground() {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Icon(
            Icons.delete,
            color: AppColors.appBaseColor,
          ),
          Text(
            " Delete",
            style: AppFontStyle.poppinsRegularTextStyle(
              15,
              fontColor: AppColors.appBaseColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Notification',
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
        padding: const EdgeInsets.only(right: 05,left: 05),
        child: SizedBox(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: para.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 05),
                child: Dismissible(
                  key: UniqueKey(),
                  background: slideLeftBackground(),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (_) {
                    var item = para.removeAt(index);
                    setState(() {

                    });
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.appBaseColor,
                        behavior: SnackBarBehavior.floating,
                        content: TextConst(
                        text: 'Notification Deleted!',
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: (){
                            para.insert(index, item);
                            setState(() {

                            });
                          },
                          textColor: Colors.black,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.90,
                    child: Card(
                      elevation: 5,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(.2),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10,left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill,
                                  image: AssetImage(AssetImageConst.carousel),
                                )
                              ),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(.3),
                              height: 0,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.45,
                                    child: TextConst(
                                      textAlign: TextAlign.justify,
                                      text: para[index],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Colors.black.withOpacity(.3),
                                    width: 40,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: (){},
                                        child: Icon(
                                          Icons.share,
                                          size: 23,
                                          color: AppColors.appBaseColor,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          var item = para.removeAt(index);
                                          setState(() {

                                          });
                                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              backgroundColor: AppColors.appBaseColor,
                                              behavior: SnackBarBehavior.floating,
                                              content: TextConst(
                                                text: 'Notification Deleted!',
                                                color: Colors.black,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                              action: SnackBarAction(
                                                label: 'UNDO',
                                                onPressed: (){
                                                  para.insert(index, item);
                                                  setState(() {

                                                  });
                                                },
                                                textColor: Colors.black,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          size: 23,
                                          color: AppColors.appBaseColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
