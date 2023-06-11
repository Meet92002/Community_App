import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {

  List<String> emergencyImages = [
    AssetImageConst.police,
    AssetImageConst.fire,
    AssetImageConst.ambulance,
    AssetImageConst.train,
    AssetImageConst.airplan,
    AssetImageConst.electrics,
  ];

  List<String> emergencyNames = [
    "Police",
    "Fire",
    "Ambulance",
    "Train",
    "Airplane",
    "Electric",
  ];

  List<String> emergencyContact = [
    "100",
    "101",
    "108",
    "1800111139",
    "18001801407",
    "155333",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Emergency',
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
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 180,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black.withOpacity(.2),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.black.withOpacity(.2),
                            child: CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.grey.shade200,
                              child: Image.asset(
                                emergencyImages[index],
                                width: 30,
                                height: 30,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 08,
                          ),
                          TextConst(
                            text: emergencyNames[index],
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          TextConst(
                            text: emergencyContact[index],
                            fontSize: 12,
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        openDialPad(
                            '${emergencyContact[index]}');
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(09),
                            bottomRight: Radius.circular(09),
                          ),
                          color: AppColors.appBaseColor,
                        ),
                        child: Center(
                          child: TextConst(
                            text: 'CALL',
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

openDialPad(String phoneNumber) async {
  Uri url = Uri(scheme: "tel", path: phoneNumber);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print("Can't open dial pad.");
  }
}