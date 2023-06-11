import 'package:community_app/Screens/qr_code/qr_result_screen.dart';
import 'package:community_app/components/text_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({Key? key}) : super(key: key);

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  bool isScanCompleted = false;
  bool isFlashOn = false;
  bool isFrontCamera = false;

  MobileScannerController mobileScannerController = MobileScannerController();

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextConst(
          text: 'QR Scanner',
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
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isFlashOn = !isFlashOn;
              });
              mobileScannerController.toggleTorch();
            },
            icon: Icon(
              isFlashOn ? Icons.flash_on_rounded : Icons.flash_off_rounded,
              color: isFlashOn ? AppColors.appBaseColor : Colors.black87,
            ),
          ),
          IconButton(
            onPressed: (){
              setState(() {
                isFrontCamera = !isFrontCamera;
              });
              mobileScannerController.switchCamera();
            },
            icon: Icon(
              Icons.camera_front_rounded,
              color: isFrontCamera ? AppColors.appBaseColor : Colors.black87,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextConst(
                    text: 'Plece the QR code in the area',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    letterSpacing: 1,
                    color: Colors.black87,
                  ),
                  SizedBox(
                    height: 05,
                  ),
                  TextConst(
                    text: 'Scanning will be started automatically',
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: MobileScanner(
                      controller: mobileScannerController,
                      allowDuplicates: true,
                      onDetect: (barCode, args) {
                        if (!isScanCompleted) {
                          String code = barCode.rawValue ?? '---';
                          isScanCompleted = true;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => QrResultScreen(
                                closeScreen: closeScreen,
                                code: code,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: TextConst(
                  text: 'Developed by NMN Community',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  letterSpacing: 1,
                  color: Colors.black26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
