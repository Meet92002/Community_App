import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_add_details_page/matrimony_add_details_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_details_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_favourite_page/matrimony_favourite_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/matrimony_page/matrimony_show_details_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';
import '../../../../../components/text_field_const.dart';
import '../../../../../utils/color_const.dart';
import '../../../../../utils/image_const.dart';

class MatrimonyScreen extends StatefulWidget {
  const MatrimonyScreen({Key? key}) : super(key: key);

  @override
  State<MatrimonyScreen> createState() => _MatrimonyScreenState();
}

class _MatrimonyScreenState extends State<MatrimonyScreen> {

  List<String> gridnames = [
    "Matrimony Form",
    "Matrimony List",
    "Matrimony Favourites"
  ];

  List<String> gridimages = [
    AssetImageConst.matrimonyForm,
    AssetImageConst.matrimonyList,
    AssetImageConst.matrimonyFavourite
  ];

  List<Widget> pagesNavigator = [
    MatrimonyAddDetailsScreen(initialindex: 0,),
    const MatrimonyShowDetailsScreen(),
    const MatrimonyFavouriteScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Matrimony',
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 2.70,
        child: GridView.builder(
          padding: const EdgeInsets.only(
              top: 10, bottom: 10, right: 10, left: 10),
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 130,
          ),
          itemCount: gridnames.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => pagesNavigator[index])),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(.2)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: AppColors.circleAvatarColor,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.appShadowColor,
                          child: Image(
                            width: 30,
                            height: 30,
                            image: AssetImage(gridimages[index]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 21,
                      child: Center(
                        child: TextConst(
                          textAlign: TextAlign.center,
                          text: gridnames[index],
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
