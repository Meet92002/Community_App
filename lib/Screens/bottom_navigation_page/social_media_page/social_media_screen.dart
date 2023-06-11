import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../components/text_const.dart';
import '../../../utils/color_const.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({Key? key}) : super(key: key);

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {

  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 10, right: 05, left: 05),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black.withOpacity(.2),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius:20,
                                backgroundColor: Colors.transparent,
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundImage:
                                      AssetImage(AssetImageConst.profile),
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 07,
                              ),
                              TextConst(
                                text: 'iamniik.me',
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                letterSpacing: 1.0,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              _showFeedOption(context);
                            },
                            child: Icon(
                              Icons.more_vert,
                              size: 25,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Image.asset(
                            AssetImageConst.carousel,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isLike = !isLike;
                                  });
                                },
                                child: Icon(
                                  isLike == true ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                                  size: 25,
                                  color: isLike == true ? AppColors.appBaseColor : Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 08,
                              ),
                              GestureDetector(
                                onTap: (){
                                  _showPicker(context);
                                },
                                child: Icon(
                                  Icons.mode_comment_outlined,
                                  size: 22,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              TextConst(
                                text: '24,000 Likes',
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                letterSpacing: 1.0,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.bookmark_border_rounded,
                            size: 25,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 75,
                            child: Stack(
                              children: [
                                for (var i = 0; i < [1, 2, 3].length; i++)
                                  Positioned(
                                    left: (i * (1 - .5) * 40).toDouble(),
                                    top: 0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.grey.shade50,
                                        ),
                                        padding: const EdgeInsets.all(5.0),
                                      ),
                                      radius: 13,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 05),
                            child: Row(
                              children: [
                                TextConst(
                                  text: 'Liked',
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1.0,
                                ),
                                SizedBox(
                                  width: 02,
                                ),
                                TextConst(
                                  text: 'iamniik.me',
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1.0,
                                ),
                                SizedBox(
                                  width: 02,
                                ),
                                TextConst(
                                  text: 'and',
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1.0,
                                ),
                                SizedBox(
                                  width: 02,
                                ),
                                TextConst(
                                  text: 'others',
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        children: [
                          TextConst(
                            text: 'iamniik.me',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            letterSpacing: 1.0,
                          ),
                          SizedBox(
                            width: 05,
                          ),
                          SizedBox(
                            width: 269,
                            child: TextConst(
                              text: 'Nature is more beautiful with sunshine & sunrise',
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              letterSpacing: 1.0,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 05),
                      child: TextConst(
                        text: 'View all 64 comments',
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  void _showFeedOption(context) {
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
                    width: 45,
                    height: 06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await Share.share(
                                    'share text',
                                    subject: 'share subject text'
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(.2),
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 36,
                                  backgroundColor: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 31,
                                    backgroundColor: AppColors.appShadowColor,
                                    child: Center(
                                      child: Image.asset(
                                        AssetImageConst.shareFeed,
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextConst(
                              text: 'Share',
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              letterSpacing: 1.0,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: Colors.transparent,
                                child: CircleAvatar(
                                  radius: 31,
                                  backgroundColor: AppColors.appShadowColor,
                                  child: Center(
                                    child: Image.asset(
                                      AssetImageConst.link,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextConst(
                              text: 'Link',
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              letterSpacing: 1.0,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: Colors.transparent,
                                child: CircleAvatar(
                                  radius: 31,
                                  backgroundColor: AppColors.appShadowColor,
                                  child: Center(
                                    child: Image.asset(
                                      AssetImageConst.qr,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextConst(
                              text: 'QR',
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              letterSpacing: 1.0,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: Colors.transparent,
                                child: CircleAvatar(
                                  radius: 31,
                                  backgroundColor: AppColors.appShadowColor,
                                  child: Center(
                                    child: Image.asset(
                                      AssetImageConst.delete,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextConst(
                              text: 'Delete',
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              letterSpacing: 1.0,
                            ),
                          ],
                        ),
                      ],
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
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15,right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.grey.shade300,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 25,
                        ),
                      ),
                      TextConst(
                        text: 'Comments',
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        letterSpacing: 1.0,
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Share.share(
                            'share text',
                            subject: 'share subject text'
                          );
                        },
                        child: Image.asset(
                          AssetImageConst.shareFeed,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.035,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 05),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount: 07,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 08),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              child: ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.only(left: 10,right: 20),
                                horizontalTitleGap: 08,
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 17,
                                    backgroundImage: AssetImage(AssetImageConst.profile),
                                  ),
                                ),
                                title: TextConst(
                                  text: 'Community.me',
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1.0,
                                ),
                                subtitle: TextConst(
                                  text: 'I like your picture and picture is very fascinating and dashing...',
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                                trailing: Icon(
                                  Icons.favorite_outline_rounded,
                                  size: 20,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
