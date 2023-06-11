import 'package:flutter/cupertino.dart';
import '../Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/daily_report_page/daily_report_screen.dart';
import '../Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/job_module_page/job_module_screen.dart';
import '../Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_screen.dart';
import '../Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/member_directory_page/member_directory_screen.dart';
import '../Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/near_me_page/near_me_screen.dart';
import '../Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/share_profile_page/share_profile_screen.dart';
import '../utils/image_const.dart';

class QuickMenuConst {
  List<String> gridimages = [
    AssetImageConst.directory,
    AssetImageConst.matrimony,
    AssetImageConst.jobModule,
    AssetImageConst.shareProfile,
    AssetImageConst.nearMe,
    AssetImageConst.dailyReport
  ];

  List<String> gridnames = [
    "Members\nDirectory",
    "Matrimony",
    "Job\nModule",
    "Share\nProfile",
    "Near Me",
    "Daily\nReport"
  ];

  List<Widget> pagesNavigator = [
    const MemberDirectoryScreen(),
    const MatrimonyScreen(),
    const JobModuleScreen(),
    const ShareProfileScreen(),
    const NearMeScreen(),
    const DailyReportScreen()
  ];
}