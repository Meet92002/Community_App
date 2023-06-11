import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/dashboard_grid_pages/event_page/event_screen.dart';
import 'package:community_app/components/icon_button_const.dart';
import 'package:community_app/utils/image_const.dart';
import 'package:flutter/material.dart';

import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: 'Ganesh Chaturthi',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => EventScreen()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.20,
              child: Card(
                elevation: 5,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(.3),
                  ),
                ),
                child: const Image(
                  image: AssetImage(AssetImageConst.ganeshaEvent),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(.3),
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.657,
              child: Card(
                elevation: 5,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(.3),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 05, right: 10, left: 10, bottom: 10),
                  child: Column(
                    children: [
                      TextConst(
                        text: 'About Event',
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      Divider(
                        color: Colors.black.withOpacity(.3),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.98,
                        child: TextConst(
                          text: 'On this occasion of Ganesh Chaturthi, I wish Lord Ganpati visits your home with bags full of happiness, prosperity, and peace. -May Lord Ganesh bring you good luck and prosperity! Happy Vinayaka Chaturthi! - May Lord Ganesha bestow you power, destroy your sorrow and enhance happiness in your life. On this occasion of Ganesh Chaturthi, I wish Lord Ganpati visits your home with bags full of happiness, prosperity, and peace. -May Lord Ganesh bring you good luck and prosperity! Happy Vinayaka Chaturthi! - May Lord Ganesha bestow you power, destroy your sorrow and enhance happiness in your life. On this occasion of Ganesh Chaturthi, I wish Lord Ganpati visits your home with bags full of happiness, prosperity, and peace. -May Lord Ganesh bring you good luck and prosperity! Happy Vinayaka Chaturthi! - May Lord Ganesha bestow you power, destroy your sorrow and enhance happiness in your life. On this occasion of Ganesh Chaturthi, I wish Lord Ganpati visits your home with bags full of happiness, prosperity, and peace. -May Lord Ganesh bring you good luck and prosperity! Happy Vinayaka Chaturthi! - May Lord Ganesha bestow you power, destroy your sorrow and enhance happiness in your life. May Lord Ganesha bestow you power, destroy your sorrow and enhance happiness in your life.',
                          textAlign: TextAlign.justify,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Divider(
                        color: Colors.black.withOpacity(.3),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButtonConst(
                              function: (){},
                              icon: Icons.download_for_offline_rounded,
                              iconSize: 25,
                            ),
                            VerticalDivider(
                              color: Colors.black.withOpacity(.3),
                              indent: 8,
                              endIndent: 8,
                            ),
                            IconButtonConst(
                              function: (){},
                              icon: Icons.share,
                              iconSize: 25,
                            ),
                          ],
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
    );
  }
}
