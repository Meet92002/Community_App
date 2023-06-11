import 'package:community_app/Screens/drawer_navigation_page/about_us_page/about_us_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/contact_us_page/contact_us_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/faq_page/faq_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/feedback_page/feedback_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/notification_page/notification_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/profile_page/profile_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/setting_page/setting_menu_screen.dart';
import 'package:community_app/Screens/welcome_page/welcome_screen.dart';
import 'package:community_app/components/text_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../theme/theme_modal.dart';

class DrawerNavigationPage extends StatefulWidget {
  const DrawerNavigationPage({Key? key}) : super(key: key);

  @override
  State<DrawerNavigationPage> createState() => _DrawerNavigationPageState();
}

class _DrawerNavigationPageState extends State<DrawerNavigationPage> {
  final _auth = FirebaseAuth.instance;
  final _user = FirebaseAuth.instance.currentUser;

  void _popupDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure want to exit!'),
            actions: <Widget>[
              InkWell(
                onTap: () async {
                  await _auth.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
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
        });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          borderSide: BorderSide.none,
        ),
        child: Material(
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            borderSide: BorderSide.none,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: DrawerHeader(
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage(AssetImageConst.profile),
                              radius: 20,
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black38,
                            endIndent: 12,
                            indent: 12,
                            width: 28,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                            },
                            child: TextConst(
                              text:
                                  '${_user!.phoneNumber!.substring(_user!.phoneNumber!.length - 10)}',
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  children: <Widget>[
                    buildMenuItem(
                      onClicked: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                      },
                      text: 'Notification',
                      fontSize: 15,
                      letterSpacing: 1.5,
                      width: 25,
                      height: 25,
                      trailingwidth: 20,
                      trailingheight: 20,
                      imgPath: AssetImageConst.notification,
                      trailingimgPath: AssetImageConst.next,
                      fontFamily: 'Poppins',
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 1,
                    ),
                    // Text("FDsfsfs"),
                    // Checkbox(
                    //   value: themeChange.darkTheme,
                    //   onChanged: (bool? value) {
                    //     themeChange.darkTheme = value!;
                    //   },
                    // ),
                    // buildMenuItem(
                    //   onClicked: () {},
                    //   text: 'Dark Mode',
                    //   fontSize: 15,
                    //   letterSpacing: 1.5,
                    //   width: 25,
                    //   height: 25,
                    //   trailingwidth: 30,
                    //   trailingheight: 30,
                    //   imgPath: AssetImageConst.darkMode,
                    //   trailingimgPath: AssetImageConst.darkModeSwitchOn,
                    //   fontFamily: 'Poppins',
                    // ),
                    // const Divider(
                    //   color: Colors.black38,
                    //   height: 1,
                    // ),
                    buildMenuItem(
                      onClicked: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SettingMenuScreen()));
                      },
                      text: 'Settings',
                      fontSize: 15,
                      letterSpacing: 1.5,
                      width: 25,
                      height: 25,
                      trailingwidth: 20,
                      trailingheight: 20,
                      imgPath: AssetImageConst.setting,
                      trailingimgPath: AssetImageConst.next,
                      fontFamily: 'Poppins',
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 1,
                    ),
                    buildMenuItem(
                      onClicked: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FaqScreen()));
                      },
                      text: 'FAQ',
                      fontSize: 15,
                      letterSpacing: 1.5,
                      width: 25,
                      height: 25,
                      trailingwidth: 20,
                      trailingheight: 20,
                      imgPath: AssetImageConst.faq,
                      trailingimgPath: AssetImageConst.next,
                      fontFamily: 'Poppins',
                    ),
                    buildMenuItem(
                      text: 'Help',
                      fontSize: 15,
                      letterSpacing: 1.5,
                      width: 25,
                      height: 25,
                      trailingwidth: 20,
                      trailingheight: 20,
                      imgPath: AssetImageConst.help,
                      trailingimgPath: AssetImageConst.next,
                      fontFamily: 'Poppins',
                    ),
                    buildMenuItem(
                      onClicked: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FeedbackScreen()));
                      },
                      text: 'Feedback',
                      fontSize: 15,
                      letterSpacing: 1.5,
                      width: 25,
                      height: 25,
                      trailingwidth: 20,
                      trailingheight: 20,
                      imgPath: AssetImageConst.feedback,
                      trailingimgPath: AssetImageConst.next,
                      fontFamily: 'Poppins',
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 1,
                    ),
                    buildMenuItem(
                      onClicked: _launchURL,
                      text: 'Privacy Policy',
                      fontSize: 15,
                      letterSpacing: 1.5,
                      width: 25,
                      height: 25,
                      trailingwidth: 20,
                      trailingheight: 20,
                      imgPath: AssetImageConst.privacyPolicy,
                      trailingimgPath: AssetImageConst.next,
                      fontFamily: 'Poppins',
                    ),
                    buildMenuItem(
                      onClicked: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AboutUsScreen()));
                      },
                      text: 'About Us',
                      fontSize: 15,
                      letterSpacing: 1.5,
                      width: 24,
                      height: 24,
                      trailingwidth: 20,
                      trailingheight: 20,
                      imgPath: AssetImageConst.aboutUs,
                      trailingimgPath: AssetImageConst.next,
                      fontFamily: 'Poppins',
                    ),
                    buildMenuItem(
                      onClicked: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ContactUsScreen(
                              companyName: 'COMMUNITY',
                              textColor: Colors.black,
                              cardColor: Colors.white,
                              companyColor: AppColors.appBaseColor,
                              taglineColor: Colors.grey,
                              tagLine: 'CONNECT WITH COMMUNITY!',
                              email: 'niikpatel003@gmail.com',
                              phoneNumber: '9328978062',
                              instagram: 'iamniik.me',
                              facebookHandle: 'Niik Patel',
                              githubUserName: 'Niik003',
                            ),
                          ),
                        );
                      },
                      text: 'Contact Us',
                      fontSize: 15,
                      letterSpacing: 1.5,
                      width: 25,
                      height: 25,
                      trailingwidth: 20,
                      trailingheight: 20,
                      imgPath: AssetImageConst.contactUs,
                      trailingimgPath: AssetImageConst.next,
                      fontFamily: 'Poppins',
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 05),
                        child: TextConst(
                          text: 'v0.0.0',
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                          color: AppColors.appBaseColor,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          _popupDialog(context);
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                          await preferences.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(05),
                          ),
                          backgroundColor: AppColors.appBaseColor,
                        ),
                        child: TextConst(
                          text: 'LOGOUT',
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                          color: Colors.black,
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
    );
  }

  buildMenuItem(
      {required String text,
      required double width,
      required double height,
      required double trailingwidth,
      required double trailingheight,
      required double fontSize,
      required double letterSpacing,
      required String fontFamily,
      required String imgPath,
      required String trailingimgPath,
      VoidCallback? onClicked}) {
    const color = Colors.black;
    final hoverColor = Colors.blue[100];
    return ListTile(
      leading: Image(
        width: width,
        height: height,
        image: AssetImage(imgPath),
      ),
      trailing: Image(
        width: trailingwidth,
        height: trailingheight,
        image: AssetImage(trailingimgPath),
      ),
      title: Text(
        text,
        style: TextStyle(
            color: color,
            fontFamily: fontFamily,
            fontSize: fontSize,
            letterSpacing: letterSpacing),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

_launchURL() async {
  const url =
      'https://www.privacypolicies.com/live/ea10052c-8c7b-4e91-9468-b1ab6d5f409a';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: WebViewConfiguration(
        enableJavaScript: true,
        enableDomStorage: true,
      ),
    );
  } else {
    throw 'Could not launch $url';
  }
}
