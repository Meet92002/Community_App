import 'package:flutter/material.dart';

import '../../../../../../../components/text_const.dart';
import '../../../../../../../utils/image_const.dart';

class CompaniesListScreen extends StatefulWidget {
  const CompaniesListScreen({Key? key}) : super(key: key);

  @override
  State<CompaniesListScreen> createState() => _CompaniesListScreenState();
}

class _CompaniesListScreenState extends State<CompaniesListScreen> {

  List<String> circleAvatarImages = [
    AssetImageConst.google,
    AssetImageConst.facebook,
    AssetImageConst.ebay,
    AssetImageConst.netflix,
    AssetImageConst.apple,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 9,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black.withOpacity(.2),
                ),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    circleAvatarImages[index],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
