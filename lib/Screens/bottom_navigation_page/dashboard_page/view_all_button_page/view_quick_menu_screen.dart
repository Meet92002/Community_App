import 'package:community_app/components/quick_menu_const.dart';
import 'package:flutter/material.dart';

import '../../../../components/app_bar_const.dart';
import '../../../../components/text_const.dart';
import '../../../../utils/color_const.dart';

class ViewQuickMenuScreen extends StatefulWidget {
  const ViewQuickMenuScreen({Key? key}) : super(key: key);

  @override
  State<ViewQuickMenuScreen> createState() => _ViewQuickMenuScreenState();
}

class _ViewQuickMenuScreenState extends State<ViewQuickMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarConst(
          text: '',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: (){
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
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 130,
          ),
          itemCount: QuickMenuConst().gridnames.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => QuickMenuConst().pagesNavigator[index])),
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
                            image: AssetImage(QuickMenuConst().gridimages[index]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 21,
                      child: Center(
                        child: TextConst(
                          textAlign: TextAlign.center,
                          text: QuickMenuConst().gridnames[index],
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
