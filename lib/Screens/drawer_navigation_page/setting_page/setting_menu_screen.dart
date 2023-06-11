import 'package:community_app/Screens/drawer_navigation_page/setting_page/security_page/security_screen.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import '../../../components/app_bar_const.dart';

class SettingMenuScreen extends StatefulWidget {
  const SettingMenuScreen({Key? key}) : super(key: key);

  @override
  State<SettingMenuScreen> createState() => _SettingMenuScreenState();
}

class _SettingMenuScreenState extends State<SettingMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Settings',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    buildMenuItem(
                      text: 'Account',
                      width: 30,
                      height: 30,
                      trailingwidth: 20,
                      trailingheight: 20,
                      fontSize: 16,
                      letterSpacing: 1.5,
                      fontFamily: 'Poppins',
                      imgPath: AssetImageConst.user,
                      trailingimgPath: AssetImageConst.next,
                    ),
                    buildMenuItem(
                      onClicked: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecurityScreen()));
                      },
                      text: 'Security',
                      width: 30,
                      height: 30,
                      trailingwidth: 20,
                      trailingheight: 20,
                      fontSize: 16,
                      letterSpacing: 1.5,
                      fontFamily: 'Poppins',
                      imgPath: AssetImageConst.security,
                      trailingimgPath: AssetImageConst.next,
                    ),
                  ],
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
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Card(
        elevation: 5,
        child: ListTile(
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
              letterSpacing: letterSpacing,
            ),
          ),
          hoverColor: hoverColor,
          onTap: onClicked,
        ),
      ),
    );
  }
}
