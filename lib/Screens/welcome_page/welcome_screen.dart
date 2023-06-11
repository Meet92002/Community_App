import 'package:community_app/Screens/login_page/otp_screen.dart';
import 'package:community_app/components/text_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/font_style_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final _formKey = GlobalKey<FormState>();
  final countryPicker = const FlCountryCodePicker();
  String? countryCode = "+91";
  final mobileController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.10,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetImageConst.welcome),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      TextConst(
                        text: 'WELCOME COMMUNITY',
                        fontSize: 25,
                        color: AppColors.appBaseColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        letterSpacing: 1.5,
                      ),
                      TextConst(
                        text: 'Connect with community!',
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        letterSpacing: 1.5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: AppColors.appShadowColor,
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 15,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.25,
                            height: MediaQuery.of(context).size.height / 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 15,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    color: AppColors.appShadowColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 25),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                final code = await countryPicker.showPicker(context: context);
                                                if (code != null)  print(code);
                                                setState(() {
                                                  countryCode= code!.dialCode;
                                                });
                                              },
                                              child: Container(
                                                width: 65,
                                                height: 58,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    bottomLeft: Radius.circular(20),
                                                  ),
                                                  color: AppColors.appBaseColor,
                                                ),
                                                child: Center(
                                                  child: TextConst(
                                                    textAlign: TextAlign.center,
                                                    text: countryCode,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width / 2.10,
                                              height: 58,
                                              child: TextFormField(
                                                textAlignVertical: TextAlignVertical.top,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 1,
                                                ),
                                                keyboardType: TextInputType.phone,
                                                cursorColor: AppColors.appBaseColor,
                                                controller: mobileController,
                                                decoration: InputDecoration(
                                                  hintText: 'Enter Mobile Number',
                                                  isDense: false,
                                                  isCollapsed: false,
                                                  hintStyle: AppFontStyle.poppinsRegularTextStyle(
                                                    15,
                                                    fontColor: Colors.grey,
                                                  ),
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(20),
                                                      bottomRight: Radius.circular(20),
                                                    ),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(20),
                                                      bottomRight: Radius.circular(20),
                                                    ),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(20),
                                                      bottomRight: Radius.circular(20),
                                                    ),
                                                    borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(20),
                                                      bottomRight: Radius.circular(20),
                                                    ),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.black.withOpacity(.1),
                                          endIndent: 50,
                                          indent: 50,
                                          thickness: 1.5,
                                          height: 40,
                                        ),
                                        isLoading ? CircularProgressIndicator(color: AppColors.appBaseColor) : Container(
                                          width: MediaQuery.of(context).size.width / 1.55,
                                          height: 55,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              print('object');
                                              await FirebaseAuth.instance.verifyPhoneNumber(
                                                phoneNumber: '${countryCode!+mobileController.text}',
                                                verificationCompleted: (PhoneAuthCredential credential) {

                                                },
                                                verificationFailed: (FirebaseAuthException e) {

                                                },
                                                codeSent: (String verificationId, int? resendToken) {
                                                  WelcomeScreen.verify = verificationId;
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtpScreen(text: "${mobileController.text.toString()}")));
                                                },
                                                codeAutoRetrievalTimeout: (String verificationId) {

                                                },
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 5,
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              side: BorderSide(
                                                color: AppColors.appBaseColor,
                                                width: 2,
                                              ),
                                            ),
                                            child: TextConst(
                                              text: "LOGIN",
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.appBaseColor,
                                              letterSpacing: 2.0,
                                            ),
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
  }
}