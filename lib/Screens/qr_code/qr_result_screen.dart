import 'package:community_app/components/all_button_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/text_const.dart';

class QrResultScreen extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const QrResultScreen(
      {Key? key, required this.closeScreen, required this.code})
      : super(key: key);

  // Future <void> _openURL(String url) async{
  //   if(await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: false,
  //       forceWebView: true,
  //       enableDomStorage: true,
  //     );
  //   }
  //   else{
  //     throw 'Cant open URL';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextConst(
          text: 'QR Scan Result',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          fontFamily: 'Poppins',
          letterSpacing: 1,
          color: Colors.black87,
        ),
        leading: IconButton(
          onPressed: () {
            closeScreen();
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: code,
              size: 180,
              version: QrVersions.auto,
            ),
            SizedBox(
              height: 15,
            ),
            TextConst(
              text: 'Scanned Result:',
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'Poppins',
              letterSpacing: 1,
              color: Colors.black54,
            ),
            SizedBox(
              height: 05,
            ),
            TextConst(
              text: '$code',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              fontFamily: 'Poppins',
              color: Colors.black87,
            ),
            SizedBox(
              height: 20,
            ),
            AllButtonConst(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: code));
                Fluttertoast.showToast(
                  msg: 'Text Copied!',
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: AppColors.appBaseColor,
                  textColor: Colors.black,
                );
              },
              color: AppColors.appBaseColor,
              text: 'COPY',
              width: MediaQuery.of(context).size.width,
              height: 50,
              fontSize: 20,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            AllButtonConst(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: code));
                // _openURL('$code');
                _launchURL();
              },
              color: AppColors.appBaseColor,
              text: 'GO TO WEBSITE',
              width: MediaQuery.of(context).size.width,
              height: 50,
              fontSize: 20,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
  _launchURL() async {
    String url = code;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ),
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}