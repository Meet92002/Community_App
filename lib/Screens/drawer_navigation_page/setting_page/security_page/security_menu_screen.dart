import 'package:community_app/Screens/drawer_navigation_page/setting_page/security_page/change_password_page/change_password_screen.dart';
import 'package:community_app/Screens/drawer_navigation_page/setting_page/security_page/security_screen.dart';
import 'package:flutter/material.dart';
import '../../../../components/app_bar_const.dart';
import '../../../../utils/image_const.dart';

class SecurityMenuScreen extends StatefulWidget {
  const SecurityMenuScreen({Key? key}) : super(key: key);

  @override
  State<SecurityMenuScreen> createState() => _SecurityMenuScreenState();
}

class _SecurityMenuScreenState extends State<SecurityMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Security',
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
                      onClicked: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                      },
                      text: 'Change Password',
                      width: 30,
                      height: 30,
                      trailingwidth: 20,
                      trailingheight: 20,
                      fontSize: 16,
                      letterSpacing: 1.5,
                      fontFamily: 'Poppins',
                      imgPath: AssetImageConst.password,
                      trailingimgPath: AssetImageConst.next,
                    ),
                    buildMenuItem(
                      text: 'Change Mobile Number',
                      width: 30,
                      height: 30,
                      trailingwidth: 20,
                      trailingheight: 20,
                      fontSize: 16,
                      letterSpacing: 1.5,
                      fontFamily: 'Poppins',
                      imgPath: AssetImageConst.mobile,
                      trailingimgPath: AssetImageConst.next,
                    ),
                    buildMenuItem(
                      onClicked: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecurityScreen()));
                      },
                      text: 'Change Email',
                      width: 30,
                      height: 30,
                      trailingwidth: 20,
                      trailingheight: 20,
                      fontSize: 16,
                      letterSpacing: 1.5,
                      fontFamily: 'Poppins',
                      imgPath: AssetImageConst.gmail,
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
