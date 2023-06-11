import 'dart:async';
import 'package:community_app/Screens/home_page.dart';
import 'package:community_app/Screens/welcome_page/welcome_screen.dart';
import 'package:community_app/utils/font_style_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import '../../components/text_const.dart';
import '../../utils/color_const.dart';
import '../../utils/image_const.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class OtpScreen extends StatefulWidget {
  String? text;
  OtpScreen({Key? key, required this.text}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  Timer? countDownCount;
  int timerCountData = 60;

  bool isIsCountDown = false;
  bool isLoading = false;

  String? notificationToken;
  String? countryCode = "+91";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUSerTokenGenerate();
    countDownTimerData();

  }

  getUSerTokenGenerate() async{
    print("get User toke  is call");
    notificationToken = await FirebaseMessaging.instance.getToken();
    print("Token: $notificationToken");
  }

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    countDownCount!.cancel();
    super.dispose();
  }

  bool showError = false;

  countDownTimerData() {
    countDownCount = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timerCountData == 0) {
          timerCountData = 0;
          countDownCount!.cancel();
          setState(() {
            isIsCountDown = true;
          });
        } else {
          timerCountData--;
        }
      });
    });
  }

  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final mobileController = TextEditingController();
  final otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    const length = 6;
    const borderColor = AppColors.appBaseColor;
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = AppColors.appShadowColor;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      textStyle: AppFontStyle.poppinsRegularTextStyle(
        22,
        fontColor: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.10,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetImageConst.otp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      TextConst(
                        text: 'Verification',
                        fontSize: 25,
                        color: AppColors.appBaseColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        letterSpacing: 1.5,
                      ),
                      TextConst(
                        textAlign: TextAlign.center,
                        text:
                        'We will send you a One Time Password',
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextConst(
                            textAlign: TextAlign.center,
                            text:
                                'on your mobile number ',
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            letterSpacing: 1,
                          ),
                          TextConst(
                            textAlign: TextAlign.center,
                            text:
                            '+91 ${widget.text}',
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            letterSpacing: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.86,
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
                            child: Form(
                              key: formKey,
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
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
                                    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                                    child: Pinput(
                                      closeKeyboardWhenCompleted: true,
                                      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                                      length: length,
                                      controller: otpController,
                                      focusNode: focusNode,
                                      defaultPinTheme: defaultPinTheme,
                                      onCompleted: (pin) {
                                        setState(
                                            () => showError = pin != '5555');
                                      },
                                      focusedPinTheme: defaultPinTheme.copyWith(
                                        height: 60,
                                        width: 56,
                                        decoration: defaultPinTheme.decoration!
                                            .copyWith(
                                          border:
                                              Border.all(color: borderColor),
                                        ),
                                      ),
                                      errorPinTheme: defaultPinTheme.copyWith(
                                        decoration: BoxDecoration(
                                          color: errorColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: isIsCountDown == true
                                              ? () async {
                                                  countDownTimerData();
                                                  isIsCountDown = false;
                                                  timerCountData = 60;
                                                  setState(() {});
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
                                                }
                                              : () {
                                                  Fluttertoast.showToast(
                                                    msg: "Please wait till time are off!",
                                                    gravity: ToastGravity.BOTTOM,
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    backgroundColor: AppColors.appBaseColor,
                                                    textColor: Colors.black,
                                                  );
                                                },
                                          child: TextConst(
                                            text: 'Resend Code?',
                                            fontSize: 15,
                                            color: isIsCountDown == true
                                                ? Colors.green
                                                : Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        isIsCountDown == true
                                            ? Container(
                                                height: 0,
                                              )
                                            : TextConst(
                                                text:
                                                    ' 00:${timerCountData.toString().padLeft(2, "0")}',
                                                fontSize: 17,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Poppins',
                                              ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: isLoading ? CircularProgressIndicator(color: AppColors.appBaseColor) :  Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.55,
                                      height: 55,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          try {
                                            PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: WelcomeScreen.verify, smsCode: otpController.text);
                                            await auth.signInWithCredential(credential);
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                                          } catch(e) {

                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 5,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          side: BorderSide(
                                            color: AppColors.appBaseColor,
                                            width: 2,
                                          ),
                                        ),
                                        child: TextConst(
                                          text: 'VERIFY',
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appBaseColor,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
