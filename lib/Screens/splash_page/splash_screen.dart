import 'dart:async';

import 'package:community_app/Screens/welcome_page/welcome_screen.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userCheck();

   timer =  Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => _user == null ? WelcomeScreen() : HomePage())),);
  }

  userCheck (){
    var User = _auth.currentUser;
    print("USER Authinticate: $User");
    if(User == null){
      _user = null;
    }else {
      _user = User;
    }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image(
                  width: 350,
                  height: 350,
                  image: AssetImage(AssetImageConst.logo),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
