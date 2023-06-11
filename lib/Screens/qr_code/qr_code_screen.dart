import 'package:barcode_widget/barcode_widget.dart';
import 'package:community_app/Screens/qr_code/qr_scan_screen.dart';
import 'package:community_app/components/text_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/app_bar_const.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {

  TextEditingController controller = TextEditingController();
  String barcodeData = "12345";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'QR CODE',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_ios_rounded,
          iconColor: Colors.black,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 50,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(AssetImageConst.profile),
                radius: 48,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextConst(
              text: 'COMMUNITY APP',
              fontSize: 19,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: AppColors.appBaseColor,
              letterSpacing: 1,
            ),
            TextConst(
              text: 'CONNECT COMMUNITY',
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Colors.black45,
              letterSpacing: 1,
            ),
            SizedBox(
              height: 70,
            ),
            TextConst(
              text: 'Scan QR Code:',
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: AppColors.appBaseColor,
              letterSpacing: 1.5,
            ),
            Divider(
              color: Colors.black.withOpacity(.2),
              height: 30,
              indent: 90,
              endIndent: 90,
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black.withOpacity(.2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: BarcodeWidget(
                    data: barcodeData,
                    barcode: Barcode.qrCode(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrScanScreen()));
              },
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.appBaseColor,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Image.asset(
                    AssetImageConst.qrCode,
                    width: 35,
                    height: 35,
                    filterQuality: FilterQuality.high,
                    color: AppColors.appBaseColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
