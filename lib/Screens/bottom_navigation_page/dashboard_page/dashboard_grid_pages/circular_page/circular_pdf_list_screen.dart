import 'package:community_app/components/text_const.dart';
import 'package:community_app/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPdfListScreen extends StatefulWidget {
  const CircularPdfListScreen({Key? key, required this.courseName})
      : super(key: key);

  final String courseName;

  @override
  State<CircularPdfListScreen> createState() => _CircularPdfListScreenPage();
}

class _CircularPdfListScreenPage extends State<CircularPdfListScreen> {
  int downloadProgress = 0;
  bool isDownloadStarted = false;
  bool isDownloadFinish = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(.3),
          ),
        ),
        child: ListTile(
          title: Text(
            "${widget.courseName}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 13,
              color: Colors.black,
            ),
          ),
          leading: CircleAvatar(
            radius: 17,
            backgroundColor: Color((0xffF78C8C).toInt()).withOpacity(1.0),
            child: Text(
              widget.courseName.substring(0, 1).toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isDownloadStarted,
                child: Padding(
                  padding: const EdgeInsets.only(right: 9.5),
                  child: CircularPercentIndicator(
                    animateFromLastPercent: true,
                    animation: true,
                    radius: 15.0,
                    lineWidth: 1.5,
                    percent: (downloadProgress / 100),
                    center: Text(
                      "$downloadProgress%",
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.appBaseColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    progressColor: AppColors.appBaseColor,
                  ),
                ),
              ),
              Visibility(
                visible: !isDownloadStarted,
                child: IconButton(
                  icon: isDownloadFinish
                      ? const Icon(Icons.download_done_rounded)
                      : const Icon(Icons.download_for_offline_rounded),
                  color:
                      isDownloadFinish ? AppColors.appBaseColor : Colors.black,
                  onPressed: downloadCourse,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void downloadCourse() async {
    isDownloadStarted = true;
    isDownloadFinish = false;
    downloadProgress = 0;
    setState(() {});
    while (downloadProgress < 100) {
      downloadProgress += 10;
      setState(() {});
      if (downloadProgress == 100) {
        isDownloadFinish = true;
        isDownloadStarted = false;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.appBaseColor,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(milliseconds: 1500),
            content: TextConst(
              text: 'PDF Downloaded Successfully!',
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        );
        setState(() {});
        break;
      }
      await Future.delayed(const Duration(milliseconds: 450));
    }
  }
}
