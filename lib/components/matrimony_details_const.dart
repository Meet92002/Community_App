import 'package:community_app/components/text_const.dart';
import 'package:flutter/material.dart';

class MatrimonyDetailsConst extends StatelessWidget {
  double? width;
  double? height;
  String? title;
  String? subtitle;
  MatrimonyDetailsConst({Key? key,this.width,this.height,this.title,this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10,left: 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black.withOpacity(.2),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 05),
            child: TextConst(
              textAlign: TextAlign.center,
              text: title,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.black,
              letterSpacing: 1.5,
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(.2),
            height: 15,
            thickness: 1,
          ),
          TextConst(
            textAlign: TextAlign.center,
            text: subtitle,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.black45,
            letterSpacing: 1,
          ),
        ],
      ),
    );
  }
}
