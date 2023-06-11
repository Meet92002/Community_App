import 'package:community_app/components/text_const.dart';
import 'package:community_app/components/text_field_const.dart';
import 'package:flutter/material.dart';
import '../../../../../components/all_button_const.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../utils/color_const.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Change Password',
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
        padding: EdgeInsets.only(top: 10,right: 10,left: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.366,
          child: Card(
            elevation: 5,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10,right: 10,bottom: 10,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConst(
                    text: 'Reset Your Password',
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                  Divider(
                    color: Colors.black,
                    height: 25,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 50,
                      child: TextFieldConst(
                        onTap: (){},
                        readOnly: false,
                        filled: true,
                        hintText: 'Enter Old Password',
                        iconData: Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 50,
                      child: TextFieldConst(
                        onTap: (){},
                        readOnly: false,
                        filled: true,
                        hintText: 'Enter New Password',
                        iconData: Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 50,
                      child: TextFieldConst(
                        onTap: (){},
                        readOnly: false,
                        filled: true,
                        hintText: 'Enter Confirm Password',
                        iconData: Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AllButtonConst(
                    onPressed: (){},
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    text: 'UPDATE PASSWORD',
                    elevation: 0,
                    color: AppColors.appBaseColor,
                    fontSize: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
