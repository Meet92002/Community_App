import 'package:community_app/Screens/bottom_bar_page.dart';
import 'package:community_app/Screens/drawer_navigation_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: DrawerNavigationPage(),
      body: BottomBarPage(),
    );
  }
}
